Message-ID: <001601c2be1b$fd442050$c600a8c0@COMPAQ>
From: "Sean Oh" <oh@storageone.co.kr>
References: <20030113214928.NXIW20432.imf21bis.bellsouth.net@marsha> <002701c2bdb8$6cf51b70$c600a8c0@COMPAQ> <20030117100237.GC15042@gw.silicide.dk>
Subject: Re: re[2]: [linux-lvm] [Q] LVM snapshot volume extendable?
MIME-Version: 1.0
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
Date: Fri Jan 17 05:29:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

----- Original Message -----
From: <jon+lvm@silicide.dk>
To: <linux-lvm@sistina.com>
Sent: Friday, January 17, 2003 7:02 PM
Subject: Re: re[2]: [linux-lvm] [Q] LVM snapshot volume extendable?
> >
> > Very strange, since LVM snapshot does not hold FS. Am I right?
>
> i have successfully extented a ext3 snapshot. I did have to specify the
> mount as READONLY. You did do that too, didnt you ?
>

Yes, I specified the ro option in ext3 snapshots. But it is still not
mountable, giving the error 'Cant write to read-only device' and 'EXT3-FS:
write access unavailable, cannot proceed'
