fs = 44100; % Sampling frequency 

% Take piano keys as user input
pianoKeys = inputdlg('Enter the piano keys (separated by spaces): '); % Prompt for piano keys 
pianoKeys = str2num(pianoKeys{1}); % Convert input to numbers

% Display the input piano keys
disp('Piano Keys:');
disp(pianoKeys);

% Take durations as user input
durations = inputdlg('Enter the durations (separated by spaces): '); % Prompt for durations 
durations = str2num(durations{1}); % Convert input to numbers

% Display the input durations
disp('Durations:');
disp(durations);

% Check if the number of piano keys matches the number of durations
if length(pianoKeys) ~= length(durations)
    error('The number of piano keys and durations must be the same.');
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
    
    note = sin(2 * pi * freq * t(noteStart:noteEnd)); % Generate note waveform 
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
