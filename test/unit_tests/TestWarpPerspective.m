classdef TestWarpPerspective
    %TestWarpPerspective
    properties (Constant)
        path = fileparts(fileparts(mfilename('fullpath')))
        img = imread([TestWarpPerspective.path,filesep,'img001.jpg'])
    end
    
    methods (Static)
        function test_1
            im = TestWarpPerspective.img;
            M = eye(3); % identity transform
            dst = cv.warpPerspective(im,M);
            assert(all(im(:)==dst(:)));
        end
        
        function test_error_1
            try
                cv.warpPerspective();
                throw('UnitTest:Fail');
            catch e
                assert(strcmp(e.identifier,'mexopencv:error'));
            end
        end
    end
    
end

