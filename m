Message-ID: <3B9512CB.1090701@st-peter.stw.uni-erlangen.de>
Date: Tue, 04 Sep 2001 19:43:39 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: what i need is a little attention-RE [linux-lvm] SoftRaid and LVM   Jean-Eric Cuendet
References: <3B950A7A.40902@st-peter.stw.uni-erlangen.de> <20010904190937.A9131@colombina.comedia.it>
Content-Transfer-Encoding: 7bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: bluca@comedia.it, linux-lvm@sistina.com

well the problem currently is that i can not format the LV with ext2 or 
reiserfs
in the beginning i could access the LV only with IBM's JFS and i had 
troubles mounting it with XFS
but i've upgraded to 2.4.10-pre2-xfs-cvs and now i have no problem with XFS
but i still have the problem with ext2 and reiserfs which i think is not 
normal
and i'm wondering whether it's safe to use the LV

i used e2fsprogs-1.23 and 1.24 and reiserfs progs  3.x.0j
but when i try to format the LV mke2fs and mkreiserfs segfaults

and i can format normal partitions and software raid with mke2fs and 
mkreiserfs


the VG :

/dev/hdh10
/dev/md6  software linear RAID
/dev/md7 software linear RAID

the LV's are striped over the 3 PV's

Luca Berra wrote:

>On Tue, Sep 04, 2001 at 07:08:10PM +0200, svetljo wrote:
>
>>if smbd take a look at all meseages with sender svetljo and with subject 
>>releated to PB's with LVM on software RAID
>> i think he'll get the idea what is all about
>>
>OK i am using lvm over softraid
>can you please do a recap.
>
>L.
>
