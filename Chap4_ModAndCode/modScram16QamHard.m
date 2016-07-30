% modScram16QamHard - Run BER evaluation on simple communication system.
%
% The communication system consists of:
%   - Scrambling
%   - 16QAM modulation
%   - AWGN channel
%   - 16QAM demodulation with hard-decision
%   - Descrambling
%
% Usage:
%   [ber, nBits] = modScram16QamHard(EbNo, maxErrs, maxBits)
%
%   Transmit random bit strings of a fixed size over the described communication
%   system until either the stop condition "maxErrs" (max. number of bit errors)
%   or "maxBits" (max. number of transmitted bits) is reached. In the end,
%   calculate and return the total bit error rate and the total nubmer of trans-
%   mitted bits. The Eb/N0 of the channel is set to "EbNo".
%
% Input:
%   EbNo:     the desired Eb/N0 value in dB
%   maxErrs:  number of bit errors after which to stop the simulation
%   maxBits:  number of transmitted bits after which to stop the simulation
%
% Output:
%   ber:   the total bit error rate of the entire simulation
%   nBits: the total number of transmitted bits during the simulation
%
% Note: the interface of this function is compatible with the BERTool of the
% Communication System Toolbox.
%
% Understanding LTE With Matlab, Chap. 04, Ex. 02

% Daniel Weibel <danielmartin.weibel@polimi.it> July 2016
%------------------------------------------------------------------------------%

function [ber, nBits] = modScram16QamHard(EbNo, maxErrs, maxBits)

args.EbNo      = EbNo;
args.maxErrs   = maxErrs;
args.maxBits   = maxBits;
args.scheme    = '16QAM';
args.demodType = 'hard';

[ber nBits] = sysModScram(args);
