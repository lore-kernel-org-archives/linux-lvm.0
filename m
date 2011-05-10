Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p4AIZOWN001280
	for <linux-lvm@redhat.com>; Tue, 10 May 2011 14:35:24 -0400
Received: from qmail-admn-norm-0.netfirms.com (admin-norm-b.netfirms.com
	[70.35.17.200])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id p4AIZKXo021311
	for <linux-lvm@redhat.com>; Tue, 10 May 2011 14:35:21 -0400
Received: from steve by steve-desktop with local (Exim 4.69)
	(envelope-from <steve@netfirms.com>) id 1QJrnK-0008HO-4y
	for linux-lvm@redhat.com; Tue, 10 May 2011 14:36:30 -0400
Date: Tue, 10 May 2011 14:36:30 -0400
From: Steve Shorter <steve@netfirms.com>
Message-ID: <20110510183630.GA31792@netfirms.com>
References: <20110509203822.GA29336@netfirms.com> <4DC85F38.5070506@spinn.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4DC85F38.5070506@spinn.net>
Subject: Re: [linux-lvm] creating pv's on LVM's for virtual guests
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, May 09, 2011 at 03:40:08PM -0600, allan wrote:
> Hi Steve,
>
> I've had mixed results doing that very thing. Two servers perform very differently.
> One mach, an HP DL380G6 w/ dual quad core Zeon and 6 146G disks installed 
> with CentOS 5.5 stock xen, lvm, etc. performs very well. Another machine 
> intended as a low class server, a desktop quad core AMD, 4 SATA disks 
> installed with stock CentOS 5.5 same as first mach, has issues with disk 
> perfomance on every DomU - writes are 1/10 the rate of Dom0 -- I'm still 
> troubleshooting it.
> I see no problem with using LVM on Dom0, carving it up and offering to 
> DomU virtuals and the virtuals using LVM for storage. One thing to avoid: 
> do not duplicate an LVM names within the entire machine. i.e. installer, 
> when told to use LVM, will create a vg of a specific name. If this name 
> is not overridden, and you create multiple DomUs with same process the VG 
> name will be duplicated (as well as the LV names). Avoid name 
> duplication.
> I hope this helps.
>
> Allan


	This is what I do on the host


lvcreate --name ${DOMAIN} --size ${VSIZE}G ${HOST} || exit 2

pvcreate -y -ff /dev/${HOST}/${DOMAIN} || exit 3

vgcreate -y -ff -s32m ${DOMAIN} /dev/${HOST}/${DOMAIN} || exit 4

lvcreate --name data --size ${DISKSIZE} ${DOMAIN} || exit 5

lvcreate --name swap -l 100%FREE ${DOMAIN} || exit 6

mkfs.ext3 /dev/${DOMAIN}/data || exit 7

mkswap /dev/${DOMAIN}/swap || exit 8

	I pass /dev/${HOST}/${DOMAIN} to the quest, and it sees 
a VG ${DOMAIN} with LV's named "data" and "swap" and they are
immediately usable as swap/ext3

	Seems to work. Haven't tested for performance. Your performance issue
above seems to be hardware related??

	Any concerns?


	-steve


>
> Steve Shorter wrote:
>> Howdy!
>>
>> 	I am setting up virtual guests to have a LVM created
>> from the host. It would be good to use LVM's in the
>> guest also.. for easy volume expansion etc...
>>
>> ie. I am creating pv's/vg's/lvms on top of LVM's. It *seems* to
>> work but some of the userland tools need the option -ff
>>
>> 	Does anybody see any issues doing this?
>>
>> 	thanx - steve
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
