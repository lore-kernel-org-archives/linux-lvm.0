MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 06 Jan 2017 21:13:15 +0100
From: Xen <list@xenhideout.nl>
In-Reply-To: <88a5fbe3-0806-ac5f-7da2-0555fc6d3ff7@redhat.com>
References: <78cb8a27a39f59bc31b11e1044af620f@dds.nl>
	<20170106191902.GB22165@redhat.com>
	<6191529afb210ae7042670822f5fe1ad@xenhideout.nl>
	<88a5fbe3-0806-ac5f-7da2-0555fc6d3ff7@redhat.com>
Message-ID: <d1ef89e234cb6b846324db4f4e72a1d8@xenhideout.nl>
Subject: Re: [linux-lvm] how to change UUID of PV of duplicate partition
	(followup)
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Zdenek Kabelac schreef op 06-01-2017 21:06:

> You can always 'fix it' you way.
> 
> Just setup  device filter in  lvm.conf  so you either  see diskA or 
> diskB
> 
> In you particular  case:
> 
>  filter = [ "r|/dev/sdb4|" ]
> 
> or
> 
>  filter = [ "r|/dev/sdc4|" ]
> 
> 
> And set/change things with your existing lvm2 version....

Oh right, thank you man. I was looking for that but barring an option 
available on pvchange or vgimportclone itself I just decided to go the 
easy package upgrade route with David's help or suggestion.

I knew that should have been possible, so thanks. I just hadn't gotten 
around to diving into the config file yet. Much appreciated.

Regards.
