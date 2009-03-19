Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2JGFeku017422
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 12:15:40 -0400
Received: from wa-out-1112.google.com (wa-out-1112.google.com [209.85.146.176])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2JGF3kr010867
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 12:15:03 -0400
Received: by wa-out-1112.google.com with SMTP id v33so458760wah.19
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 09:15:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <jwveiwt3347.fsf-monnier+gmane.linux.lvm.general@gnu.org>
References: <37d33d830903190431yf906795j45f2efd5e765a2fd@mail.gmail.com>
	<jwveiwt3347.fsf-monnier+gmane.linux.lvm.general@gnu.org>
Date: Thu, 19 Mar 2009 21:44:59 +0530
Message-ID: <37d33d830903190914x43b78478xd10bc57a7374ecd@mail.gmail.com>
Subject: Re: [linux-lvm] Re: liblvm IOCTL/sysfs interface
From: Sandeep K Sinha <sandeepksinha@gmail.com>
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Mar 19, 2009 at 9:43 PM, Stefan Monnier
<monnier@iro.umontreal.ca> wrote:
>> I �would like to know if there is any means currently to know the complete
>> geometry of a LVM volume.
>> e.g, If a volume has 3 PV(targets).
>> So, we should be able to extract some information like.
>> Name of Volume.
>> Name of Volume Group.
>> Name, Range and size for each of the Physical devices involved.
> [...]
>> We do maintain these informations inside the kernel, We should atleast
>> have an ioctl or sysfs based interface to extract
>> these information.
>
> Actually, IIUC only part of this info is kept in the kernel.
> Intuitively, I'd expect that only the set of LVs, along with their size
> (and mapping to physical blocks) is kept in the kernel, whereas all the
> names are not, and neither are the volume groups.
>

Thats true. We only meant the target and maps related informations.
>
> � � � �Stefan
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
Regards,
Sandeep.





 	
�To learn is to change. Education is a process that changes the learner.�
