Message-ID: <503C8ABB.10401@redhat.com>
Date: Tue, 28 Aug 2012 11:09:15 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAGQjrKZju5zQA9_cGtO+n0WRe2t6ZSJB+SKfr23+JJ3YzntgUQ@mail.gmail.com>
	<CAGQjrKYZw27r=xgB2DaBtap-jQ1oi-7_Ydw=3z+2kw4s_03hAA@mail.gmail.com>
	<39598.78.154.109.125.1345731038.squirrel@yellowside.org.uk>
	<CAGQjrKbLD0bwedMGQP58BzdyFsnACdXLiziHLbw=tStAhX4BsA@mail.gmail.com>
	<50376BB7.7010008@bmsi.com>
	<CAGQjrKYUdQ5VL4hw+Oo=pgp4d_a9nsQA60gYHXhwVdWKtpX1qQ@mail.gmail.com>
In-Reply-To: <CAGQjrKYUdQ5VL4hw+Oo=pgp4d_a9nsQA60gYHXhwVdWKtpX1qQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvextend NEVER works but screws up
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com, tariq wali <ganaiwali@gmail.com>

Dne 27.8.2012 13:46, tariq wali napsal(a):
> Guys , thanks much for your time on the issue, really appreciate it . I had
> tried everything suggested so far (lvresize/extend) updated filesystem
> tools etc
>
> @Stuart D Gathman , YOU ARE THE MAN SIR :) and nailed it down .
>
> I wanted to reproduce the same issue again and i did that not know how
> ignorant I was being ..
>
> # lvextend -L +40G /dev/vg0/bin-logs
>    Extending logical volume bin-logs to 110.00 GB
>    Logical volume bin-logs successfully resized
>
>
> lvs
>    LV       VG   Attr   LSize   Origin Snap%  Move Log Copy%  Convert
>    bin-logs vg0  -wi-ao *110.00G*
>    data     vg0  -wi-ao 380.00G
>
> resize2fs /dev/vg0/bin-logs
> resize2fs 1.39 (29-May-2006)
> resize2fs: Filesystem has unsupported feature(s) while trying to open
> /dev/vg0/bin-logs
> Couldn't find valid filesystem superblock.
>
> #this is where I would get psyched , i did the same thing to all my ext2/3
> filesystems and have extended file systems online without an issue for
> years ..but did I fforget the file system type this time , yes indeed I for
> got we have started doing ext4 on all our new servers and didn't realise
> ext4 fancies it's own bells and whistles ..
>
> I ran the all new resize4fs as suggested by Stuart , and it made my day in
> fact it made for the whole week's frustration :)
>
> resize4fs /dev/vg0/logs
> resize4fs 1.41.12 (17-May-2010)
> Filesystem at /dev/vg0/logs is mounted on /bin-logs; on-line resizing
> required
> old desc_blocks = 7, new_desc_blocks = 9
> Performing an on-line resize of /dev/vg0/logs to 37408768 (4k) blocks.
>
> The filesystem on /dev/vg0/logs is now 37408768 blocks long.
>
>
> lvs
>    LV   VG   Attr   LSize   Origin Snap%  Move Log Copy%  Convert
>    data vg0  -wi-ao 350.00G
>    logs vg0  -wi-ao *142.70G *
>
>
> PS: I am raving fan of lvm all over again :)
>
>
> thanks everyone and issue closed !
>

How about checking 'man lvresize'
and using option  '-r'  i.e.:

lvresize -r -L +40G /dev/vg0/bin-logs

That would be time-saver...

Zdenek
