From: Holger Grothe <grothe@mathematik.tu-darmstadt.de>
Subject: Re: [linux-lvm] hmmm, curious...
Message-Id: <20020201213029.E2947@fb0442.mathematik.tu-darmstadt.de>
References: <25E4CA13D679FF48BC307694202209710164DEC1@nd1-clusa.local.bunnings.com.au>
MIME-Version: 1.0
In-Reply-To: <25E4CA13D679FF48BC307694202209710164DEC1@nd1-clusa.local.bunnings.com.au>;
    from CCoe@bunnings.com.au on Thu, Jan 31, 2002 at 09:11:13AM +0800
Content-Transfer-Encoding: quoted-printable
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Feb  1 14:31:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Thu, Jan 31, 2002 at 09:11:13AM +0800, Colin Coe wrote:
>=20
> Hi all, I have come accross a strange problem while doing some scriptin=
g
> with lvdisplay.  When I use lvdisplay piped to awk in the first example
> (noting that I have 'hard-wired' one field in awk), a second line is pr=
inted
> containing all hard-wired strings, including tabs.  But if I encase the
> lvdisplay in backticks and use echo then piped to awk the problem does =
not
> exist.
>=20
The whole "problem" is no problem and has absolutely nothing to do with l=
vm.
It's simply shell programming.

> [root@linux-lvm bin]# lvdisplay -c /dev/rootvg/bbs | awk -F: '{print $1
> "\t\t" $9 "\t" $9 "\t" "2" "\t" $4 }'
> /dev/rootvg/bbs         16      16      2       1
>                                 2
>
Works as designed :-). The output of lvdisplay -c <logvol> has two
lines. One line with the informations and one empty line. The empty
line contains no fourth or nineth field =3D=3D> Only "fixed" things are=20
printed for the second line. (awk is primarily a line orientated tool).
 =20
> [root@linux-lvm bin]# echo `lvdisplay -c /dev/rootvg/bbs` | awk -F: '{p=
rint
> $1 "\t\t" $9 "\t" $9 "\t" "2" "\t" $4 }'
> /dev/rootvg/bbs         16      16      2       1
>
Assuming you are using bash (from man bash):

              `command`

       Bash  performs  the  expansion  by  executing  command and
       replacing the command substitution with the standard  out=AD
       put  of  the  command, with any trailing newlines deleted.
                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
So, it's a feature of the shell.      =20
=20
> I have tried using sed to strip out newline characters, but this has no=
t
> helped.  lvdisplay -c /dev/rootvg/bbs | awk -F: '{print $1 "\t\t" $9 "\=
t" $9
> "\t" "2" "\t" $4 }' | sed "s/\n/ /g"
>=20
> I have a work around so it is not a major issue, but I thought I'd rais=
e it
> anyway.
>=20
If you wanna use only the first line of lvdisplay just use only the first
line, e.g. use head in pipe.

lvdisplay -c <logvol>| head -1| awk ...

Holger
--=20
Holger Grothe  (Email: grothe@mathematik.tu-darmstadt.de)
Fachbereich Mathematik, TU Darmstadt
