% \iffalse meta-comment
% 
% Copyright (C) 2013 Andrew Mundy, Jonathan Heathcote
% 
% This file is part of the Unofficial University of Manchester Beamer
% Theme package.
%
% This package is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
% 
% Since version 2.0.0a (5th October 2013) the University of Manchester
% logo has not been bundled with the package, and code has been provided
% to retrieve it as necessary - thus the logo IS NOT covered by this
% licence and remains copyright of The University of Manchester.
% - See http://www.brand.manchester.ac.uk
% 
% \fi
define(`sty',
`%<*$1>
% \StopEventually{}
include(beamer$1UniversityOfManchester.`sty')
% \Finale
%</$1>
')dnl
sty(theme)dnl
sty(colortheme)dnl
sty(fonttheme)dnl
sty(innertheme)dnl
sty(outertheme)dnl
\endinput
