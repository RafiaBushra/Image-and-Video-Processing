function optical_flow_filt(filename, threshold)
% Constructs a multimedia reader object
% filename = 'visiontraffic.avi';
% threshold = 0.01;
vidReader = VideoReader(filename);
% Initialize the optical flow object
opticFlow = opticalFlowLK('NoiseThreshold', threshold);
while hasFrame(vidReader)
    % Read the rgb frame
    frameRGB  = readFrame(vidReader);
    % Convert rgb to grayscale
    frameGray = rgb2gray(frameRGB);
    % Apply an anistropic diffusion filter
    frameGray = imdiffusefilt(frameGray);
    % Compute optical flow
    flow = estimateFlow(opticFlow, frameGray);
    % Display rgb video frame with flow vectors
    imshow(frameGray);
    hold on;
    plot(flow, 'DecimationFactor', [5 5], 'ScaleFactor', 10);
    drawnow;
    hold off;
end
end