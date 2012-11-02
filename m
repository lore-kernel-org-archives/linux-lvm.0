Message-ID: <5093A260.8000906@redhat.com>
Date: Fri, 02 Nov 2012 11:37:20 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <73698D91-B8D4-4F52-ABF3-54542ACB0690@active.ee>
In-Reply-To: <73698D91-B8D4-4F52-ABF3-54542ACB0690@active.ee>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] strange usage stats for thin LV
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Andres Toomsalu <andres@active.ee>

Dne 31.10.2012 01:04, Andres Toomsalu napsal(a):
> Hi,
>
> I'm a bit puzzled with some thin LV usage stats - hope that someone can shed a light on this.
> lvs shows that thin_backup LV is 94% used - but df  shows only 16% - where comes the difference?
>
> lvs -a -o+metadata_percent
>    LV                       VG         Attr     LSize   Pool Origin       Data%  Move Log Copy%  Convert Meta%
>    pool                     VolGroupL0 twi-a-tz   1,95t                    35,17                           2,79
>    [pool_tdata]             VolGroupL0 Twi-aot-   1,95t
>    [pool_tmeta]             VolGroupL0 ewi-aot-  14,00g
>    root                     VolGroupL0 -wi-ao--  10,00g
>    swap                     VolGroupL0 -wi-ao--  16,00g
>    thin_backup              VolGroupL0 Vwi-aotz 600,00g pool               94,51
>    thin_storage             VolGroupL0 Vwi-aotz 600,00g pool               20,98
>
>
> df -h
> Filesystem            Size  Used Avail Use% Mounted on
> /dev/mapper/VolGroupL0-root
>                        9,9G  1,3G  8,1G  14% /
> tmpfs                  16G     0   16G   0% /dev/shm
> /dev/sda1            1008M  122M  835M  13% /boot
> /dev/mapper/VolGroupL0-thin_storage
>                        591G   39G  523G   7% /storage
> /dev/mapper/VolGroupL0-thin_backup
>                        591G   90G  472G  16% /backup
>
> Thanks in advance,
>


As Stuart posted values are not related closely together.
But there are few things which are visible:

~35% tells you the number of used space in the pool - around ~700GB
~3% metadata takes - ~400MB

thin_backup has provisioned ~95%   ->  ~570GB
thin_storage                ~21%   ->  ~130GB

which seem to match approximately number of used blocks from the pool
(~570 + ~130 = ~700)

===

Now to interpret your 'df' stats:

thin_storage uses 39GB  stored in provisioned 130GB
thin_backup  uses 90GB  stored in provisioned 570GB

and there could be multi reasons for this:

- usage of large chunksize - and filesystem spreads a lot of data though the 
device - either for it's internal maintenance, or  a lot of files are located
across whole provisioned space.
- You have delete lots of files - and have not used discard for deleted areas
(i.e. for ext4 there is  'fstrim' command which will discard them)


So here you need to provide more information which filesystem is in use,
and what was the overall usage for your devices. And also are you using 
discard support or not ?
What is the kernel version in use?
(It's always worth to use latest version of lvm2 -  since there was improved
discard support configurability.

Zdenek
