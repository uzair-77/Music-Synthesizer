function Gui_interface
    fs = 44100; % Sampling frequency

    % Create the GUI interface
    f = figure('Name', 'Piano Note Generator', 'NumberTitle', 'off', 'Position', [100, 100, 400, 300]);

    % Piano keys input
    uicontrol('Style', 'text', 'Position', [50, 220, 300, 20], 'String', ['Hi from NAMAL, ' ...
        'Enter the piano keys (separated by spaces):']);
    pianoKeysInput = uicontrol('Style', 'edit', 'Position', [50, 200, 300, 20]);

    % Durations input
    uicontrol('Style', 'text', 'Position', [50, 170, 300, 20], 'String', 'Enter the durations (separated by spaces):');
    durationsInput = uicontrol('Style', 'edit', 'Position', [50, 150, 300, 20]);

    % Generate button
    generateButton = uicontrol('Style', 'pushbutton', 'Position', [150, 100, 100, 30], 'String', 'Please Generate', 'Callback', @generateSong);

    % Store handles and variables in the figure's guidata
    handles.pianoKeysInput = pianoKeysInput;
    handles.durationsInput = durationsInput;
    handles.fs = fs;
    guidata(f, handles);
end

% Callback function to generate the song
function generateSong(~, ~)
    % Retrieve handles and variables
    handles = guidata(gcbo);
    fs = handles.fs;

    pianoKeys = str2num(get(handles.pianoKeysInput, 'String')); % Convert input to numbers
    durations = str2num(get(handles.durationsInput, 'String')); % Convert input to numbers

    % Display the input piano keys
    disp('Piano Keys:');
    disp(pianoKeys);

    % Display the input durations
    disp('Durations:');
    disp(durations);

    % Check if the number of piano keys matches the number of durations
    if length(pianoKeys) ~= length(durations)
        errordlg('The number of piano keys and durations must be the same.', 'Input Error');
        return;
    end

    songDuration = sum(durations); % Calculate total song duration
    disp(['Total Song Duration: ', num2str(songDuration), ' seconds']); % Display total song duration

    t = 0:1/fs:songDuration; % Time vector
    song = zeros(size(t)); % Initialize song array
    noteStart = 1; % Start index of current note

    for i = 1:length(pianoKeys) % Iterate through piano keys
        freq = 440 * 2^((pianoKeys(i) - 69) / 12); % Calculate frequency of current note
        noteEnd = noteStart + round(durations(i) * fs) - 1; % Calculate end index of current note

        % Check if noteEnd exceeds the length of t
        if noteEnd > length(t)
            noteEnd = length(t); % Adjust noteEnd to stay within bounds
        end

        note_t = (noteStart:noteEnd) / fs; % Time vector for the current note
        note = sin(2 * pi * freq * note_t); % Generate note waveform
        song(noteStart:noteEnd) = note; % Add note to the song
        noteStart = noteEnd + 1; % Update start index for next note

        % Display information about the current note
        disp(['Note ', num2str(i), ':']);
        disp(['  Piano Key: ', num2str(pianoKeys(i))]);
        disp(['  Frequency: ', num2str(freq), ' Hz']);
        disp(['  Duration: ', num2str(durations(i)), ' seconds']);
    end

    % Plot the signal output of the piano tone
    figure;
    plot(t, song);
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Piano Tone Signal Output');
    grid on;
    soundsc(song, fs); % Play the song
end
