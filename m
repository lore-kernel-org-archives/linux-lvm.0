From: Gingia <gingiabios@email.it>
Subject: Re: [linux-lvm] i2o devices and lvm Error on LE versus PE
References: <200309201114.40369.g.murano@vinsoft.it> <20030922115453.V2618@sistina.com>
In-Reply-To: <20030922115453.V2618@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200309230029.15221.gingia@email.it>
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
Date: Tue Sep 23 05:44:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Alle 11:54, luned=EC 22 settembre 2003, Heinz J . Mauelshagen ha scritto:
> Of course you can use a metadata backup and restore it but this is no
> good advice either without knowing which changes have been made (i.e.
> multiple lvcreate/lvremove/lvextend/lvreduce meanwhile) and which metad=
ata
> backup should be restored, preusmably _all_ PVs are accessible.
>
> You want to read pvcreate and vgcfgrestore manual pages and use
> the -ll option of vgcfgrestore to analyze your backup contents.
ThnkYou Very VERY much
I tried to restore the volume with vgcfgrestore but in the past i did it=20
wrongly because i read the man pages in bad way (i had a great tears and=20
so.... ;^P )
So i didn't see that i used vgcfgrestore  with the option -l so it made t=
he=20
list  and not the restore Ah AH AH, if i think that for 2-3 day i "crying=
"=20
the server .....
When you said me to use -l to make a list then i realize.....
Thank you.
In the next time i tell you -if want- what suceeded and i was in that=20
situation ....
By=20
