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
���Zuninstall.sh �X�o�D>�ŋ�*v���@���?V���+q�B�=���3ff�֢H�+8rXB��raO����3iwo��=vj;c�	y���y��7���Й`�L\�s0wF&���Ą/�!"� y!�CP����K0���&\�Q�
L	p��D "s�(�04+���qכ�	d4e�a�냕�y��
�(�<J&):4�cP���|�VŚ�Paw��|r3 @gX��ؐ#����}:YJ�01	���w���M`�8>�;$����br��'	+H�5^s�d]w���̰,@A�֦B՚���&��}���Yk�F�0JV�܃�r%�TÊ�j2��pRΜ�zn�!�%�޷G�hO��IB�Һo����0|���}P�\��(B��eY�Q����SB���+ �MX���|=�����P��+�B��$SAmF��R�ft�7w��msW:��SSk��
L]#��[��aD����Ӫ��3ե\o_-�z�zi���eX�U/�i�HOOOA���JL�%_�7e�1-����H�ڕ+�Z�%߆���H���ɍs��Y�����<�Y����]�����%��X�����K⣝7=W��0�9r��|<�)C	X��2�����)7�H��̦�(f:I�H�}4�.)`���<�toչ*xC̳�Q��⨨2Qڊ����ᬰY�B����\Pđ|{I˵�fOܙ��_7�戀ŗ�~GqJp$�2��87���m\�Ҿ�����X(q\)�-�ꔶ��pjM)�������?�y�I�j�Q��H�Vy�&�[d�$Ra�kLk_��r^��'�_t�P&����>9��?�ÛX�1�,�8�-�"){2���y��V[�g~��Y�C1���FѼ5�aK$X���VU��x!�T|a.tf��ʁp�-7t�R�hP*�M�5Eb%jZ�t���ڭ��E,q��M1/��o��է�(������\?~��|���O/�]�|q�óŋ?�~|���_���|r���귇���b+�0��r8qŴ�|�������������F�-�I�c��yT�AR�ӕ��p,��I@{��ſr���P~K�  