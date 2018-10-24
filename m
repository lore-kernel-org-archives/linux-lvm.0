Message-Id: <5BCFD78A020000F90003C8CA@prv1-mh.provo.novell.com>
Date: Tue, 23 Oct 2018 20:23:06 -0600
From: "Gang He" <ghe@suse.com>
References: <20181008150016.GB21471@redhat.com>
	<5BC42808020000F90003A3E5@prv1-mh.provo.novell.com>
	<20181015152648.GB29274@redhat.com>
	<5BC6C5AC020000F90003ACAD@prv1-mh.provo.novell.com>
	<20181017141025.GA9941@redhat.com> <20181017184204.GC14214@redhat.com>
	<5BC84979020000F90003B507@prv1-mh.provo.novell.com>
	<20181018160159.GA28661@redhat.com> <20181018175923.GC28661@redhat.com>
	<5BCE854D020000F90003C508@prv1-mh.provo.novell.com>
	<20181023150436.GB8413@redhat.com>
	<59EBFA5B020000E767ECE9F9@prv1-mh.provo.novell.com>
In-Reply-To: <59EBFA5B020000E767ECE9F9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Fails to create LVM volume on the top of RAID1
 after upgrade lvm2 to v2.02.180
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
Content-Type: text/plain; charset="us-ascii"
To: teigland@redhat.com
Cc: Sven Eschenberg <sven@eschenberg.eu>, linux-lvm@redhat.com

Hello David,

I am sorry, I can not understand your reply quickly.

>>> On 2018/10/23 at 23:04, in message <20181023150436.GB8413@redhat.com>, David
Teigland <teigland@redhat.com> wrote:
> On Mon, Oct 22, 2018 at 08:19:57PM -0600, Gang He wrote:
>>   Process: 815 ExecStart=/usr/sbin/lvm pvscan --cache --activate ay 9:126 
> (code=exited, status=5)
>> 
>> Oct 22 07:34:56 linux-dnetctw lvm[815]:   WARNING: Not using device 
> /dev/md126 for PV qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV.
>> Oct 22 07:34:56 linux-dnetctw lvm[815]:   WARNING: PV 
> qG1QRz-Ivm1-QVwq-uaHV-va9w-wwXh-lIIOhV prefers device /dev/sdb2 because 
> of previous preference.
>> Oct 22 07:34:56 linux-dnetctw lvm[815]:   Cannot activate LVs in VG vghome 
> while PVs appear on duplicate devices.
> 
> I'd try disabling lvmetad, I've not been testing these with lvmetad on.
your means is, I should let the user disable lvmetad? 

> We may need to make pvscan read both the start and end of every disk to
> handle these md 1.0 components, and I'm not sure how to do that yet
> without penalizing every pvscan.
What can we do for now? it looks there needs add more code implement this logic.

Thanks
Gang

> 
> Dave
