From: Steve Brueggeman <stevebr@primenet.com>
Subject: [linux-lvm] Re: applying latest patch-howto
Date: Tue, 16 Mar 1999 13:14:15 GMT
Message-ID: <36ee5701.218858342@smtp.primenet.com>
References: <36EE473E.BCE4BA8D@post10.tele.dk>
In-Reply-To: <36EE473E.BCE4BA8D@post10.tele.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Peter MN <pmn@post10.tele.dk>
Cc: linux-lvm@msede.com


On Tue, 16 Mar 1999 12:57:50 +0100, you wrote:

>Hi  folks
>
>Can anyone help to find the correct way to impl. the new patch (
>lvm_0.6-patch-15031999a.gz)  for lvm.
>
>Regards.
>
>Peter Michael Nielsen
>

=46irst, get a clean lvm-0.6 gziped tar, from
ftp://linux.msede.com/lvm/v0.6/lvm_0.6.tar.gz
and unpack it to the directory of your choosing,=20

tar -xzf lvm_0.6.tar.gz

(you should already know this part), which will create a LVM/0.6/..... =
directory
tree.

Second, if you put Heinz's latest patch in the same directory as the
lvm_0.6.tar.gz file, do the following

gzip -dc lvm_0_6-patch-15031999a | (cd LVM/0.6; patch -p1)

This should successfully patch two files

tools/lib/lvm_tab_get_free_blk_dev.c
and
tools/lib/lvm_get_iop_version.c

If you get bad results, I must have mistyped something, so let me know =
and I'll
correct it.

Steve Brueggeman
