Message-ID: <3256.24.46.54.254.1031409280.squirrel@mail.scottsavarese.com>
Subject: Re: [linux-lvm] software mirroring
From: "Scott Savarese" <scott@scottsavarese.com>
In-Reply-To: <20020906201136.GB5094@localhost>
References: <4808.24.46.54.254.1031320260.squirrel@mail.scottsavarese.com>
        <20020906201136.GB5094@localhost>
MIME-Version: 1.0
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
Date: Sat Sep  7 09:35:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com
Cc: linux-lvm@24x7linux.com

Jos=E9 Luis Domingo L=F3pez said:
>> Or is it preferered to create LV's with LVM, and then run RAID ontop
>> of the LVM disks? (and then mirror /boot seperately).
>>
> Better the other way: RAID on top of physical disks (to get protection
> against a disk failure) and above RAID (be it sotf or hard) LVM (the
> inner layer gives you RAID1 capabilities, and LVM works as usual).

Is there any sort of procedure written on how to do this on a system with
only two disks? If I mirror the disks, then I now have 1 logical disk, in
which case I can't install LVM on top.

Thanks,
Scott
