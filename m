Message-ID: <3F6806CC.6050506@tupshin.com>
From: Tupshin Harper <tupshin@tupshin.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvscan showing 0 free on all PV's.
References: <3F676739.13431.C25AFD2@localhost> <3F675CDB.80002@tupshin.com> <3F6804B5.6060608@webhackande.se>
In-Reply-To: <3F6804B5.6060608@webhackande.se>
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
Date: Wed Sep 17 02:02:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Rickard Olsson wrote:

> Tupshin Harper wrote:
>
>> If you are using reiserfs, jfs, or xfs, you are probably out of luck, 
>> as these filesystems don't currently support reduction.
>
>
> resize_reiserfs shrinks or grows reiserfs3 filesystems.
>
> http://www.namesys.com/resize_reiserfs.html
>
> [evidence type=anecdotal] I have used it to grow and shrink my 
> reiserfs filesystems on many occasions for several years with no 
> problems whatsoever. [/evidence] I typically use ext3 on the / and 
> /boot partitions and LVM with Reiser on all large storage areas, like 
> /home and /files. This is specifically because it is easy to change 
> the sizes of the filesystems and handle the disks - move them around 
> and so on.

Yup, I misspoke. It's JFS and XFS that don't shrink.

-Tupshin
