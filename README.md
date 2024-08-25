
# Piano Synthesizer with GUI Interface

## Overview

This project is a piano synthesizer implemented in MATLAB. It allows users to generate a piano-like tone based on user-defined piano keys and durations. The program includes a graphical user interface (GUI) to make interaction more user-friendly. The GUI enables users to input piano keys and durations, generate the corresponding sound, and visualize the output signal.

## Features

1. **User Input**
   - **Piano Keys**: Users can enter a sequence of piano keys corresponding to MIDI note numbers.
   - **Durations**: Users specify the duration for each piano key.

2. **Sound Generation**
   - The program calculates the frequency for each piano key and generates a waveform for the corresponding note.
   - The synthesized notes are concatenated to create a complete song.

3. **GUI Interface**
   - Provides text boxes for users to input piano keys and durations.
   - Includes a button to generate the song based on the user input.
   - Displays the synthesized signal as a plot and plays the generated sound.

## How It Works

1. **Initialization**
   - The program initializes with a default sampling frequency (`fs`) of 44100 Hz.
   - It creates a GUI window with input fields for piano keys and durations and a button to generate the song.

2. **User Input**
   - **Piano Keys**: Users input MIDI note numbers for the piano keys (e.g., 60 for Middle C).
   - **Durations**: Users specify the duration (in seconds) for each corresponding piano key.

3. **Validation**
   - The program checks if the number of piano keys matches the number of durations. If not, it displays an error message.

4. **Song Generation**
   - The total duration of the song is calculated as the sum of all specified durations.
   - A time vector is created to cover the entire song duration.
   - For each piano key:
     - The frequency is calculated using the formula for MIDI notes.
     - A sine wave is generated for the note's duration and added to the song array.
     - Information about the note is displayed in the command window.

5. **Visualization and Playback**
   - A plot of the synthesized piano tone is displayed.
   - The generated song is played back using MATLAB’s `soundsc` function.

## GUI Components

1. **Piano Keys Input**
   - A text box where users can enter piano keys (separated by spaces).

2. **Durations Input**
   - A text box where users can enter the corresponding durations (separated by spaces).

3. **Generate Button**
   - A button that, when pressed, triggers the song generation based on the provided inputs.

## Example Usage

### Input

- **Piano Keys**: `60 62 64 65`
- **Durations**: `0.5 0.5 1 1`

### Output

- **Console Display**:
  ```
  Piano Keys:
  60 62 64 65
  Durations:
  0.5 0.5 1 1
  Total Song Duration: 2 seconds
  Note 1:
    Piano Key: 60
    Frequency: 261.63 Hz
    Duration: 0.5 seconds
  Note 2:
    Piano Key: 62
    Frequency: 293.66 Hz
    Duration: 0.5 seconds
  Note 3:
    Piano Key: 64
    Frequency: 329.63 Hz
    Duration: 1 seconds
  Note 4:
    Piano Key: 65
    Frequency: 349.23 Hz
    Duration: 1 seconds
  ```

- **Plot**: A graph showing the amplitude of the generated piano tone over time.

- **Sound**: The generated song is played back, allowing users to hear the synthesized piano notes.

## Requirements

- MATLAB (R2020a or later recommended)

## Running the Program

1. Save the code in a file named `piano_synthesizer.m`.
2. In MATLAB, navigate to the directory containing the file.
3. Run the program by typing:
   ```matlab
   Gui_interface
   ```
4. Use the GUI to input piano keys and durations, then click the "Please Generate" button to create and play the song.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
