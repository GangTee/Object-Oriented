#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
���Zfpga_run.sh �X[o۸~�~�T��c�v�]� :8i�Ʀ�a�i��B�%��F&�r�=�߾C�F9M�.6�-����7ü~�/�D��ftsz>���U����_����7p��x<'��ٗ����'����pΆ����{۔����y7���σ^��^����P�z5��g����*�%���^$��H��N�,�4M���L��J����\��P���{����Fׅƙ�U�Uo��ӫ�ߒ��r^9�w����q>�����jh,ɝTt�[�)�^�.����C�&D���`$����<D?aɲ�ɨ�\L.Oó������H�/�	7���̗���כ3���ӯ]���B��S߼�I�TZ�'i*}�����)�N?_w�C|�����0	�!Z�����a�
LBFI�|���[*$S"�9(�+��.�:'�֔;���,�	\@�$��%ܴ�����)gɴ+݈-�{.8��T�")נ��B�,v�t�����|#q4|���M��":(���*�h$�3*��LԮ�΅ �(y��QW}x���Dq>����"�Ō�t(����-4�6����nA�/�0��C|@�{�?\8�O�1�:��������dcU��)�lצ����BI�@c����*R^�Z�OJ$�"���N�X!�=��6#֙ LL��4I��.rGW�c!N�G�[��D	=ֵ�X0kч�kXQNQ�B�H���� �)�Gk�����IOQ](�ƅ=-n�w���uQ�y�~�ST����Hm���'"���\�t�LD�ǅ�#�I�G���-O�I1omr�֊Q�iC�-	K����t���o�2�Y��(��`�}��W7��D�jx��voP�蕰7�vK̷��)���U���g�7���n��y���28�[�j�$|*�nY�r���DkƩk,`kdW��4Ų@7��TE��+��*�b,U�$R�]�ļlb�z��O@O|�F�����򑆲5�v�f��T"= ��X��dB1�wu&tGB��D8?p"�0c���8z&���q�p�Վp);��d��f��~����T�1�VUB��X%�lk�'��>Ͱ�֔��$S���pb���cM��i�t��O��0M�;�,8��V�� U��k����o$����������7Q��R��HGf��YE�2��\�a'�����eg�ѡF۫�R�^g�d�qhҚ�گ���M�p`�Ԋeķ8Mb�R�B�T/�T��2� ��Ki�l��z�q�i����qf�����/��dوh�pq����i+����:�ܮ��&c���K�/tw���\�N_65#��N�����48)W{����u&���j��g�+c��c:,k���=�ڋ��6��H���D�Xd��aҘ.i���k"�wy�|���L����̼ ��N`F�c�z��wz0x��F9�7t��^p9���W�ե@+x��U�:��u�<U��F�.��p�:
�2�,n�*n0 �(�>���'�_l�4��}�'	�qm�U����%�x�)�!<�W\L�Nl��)�����rTƏ ��v�UΠ+����ܫ��w)�N�E�Ngs�L���8�M��Dq�g�����h�g���5� �ޟ��9��2�[2�(r<N�H1�]I���p�RO[3�u�2����מ.S�O�8F�!����'˚|2Uh��_����j~6����$�Σ�_~�������2ת�[?,���2��ּV�m�e3*cQ�F}�C��ǂS�J��/�ku�����݁N�j'��K2e1�p�ݻ�u����ϖ:�o�@q���]���R�j���?o^��?�����T�Q����v�����c��Kvw�+���8  