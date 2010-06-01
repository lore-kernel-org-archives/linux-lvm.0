Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o51Fv8hS018379
	for <linux-lvm@redhat.com>; Tue, 1 Jun 2010 11:57:08 -0400
Received: from kyoto.noir.com (m209-5.dsl.rawbw.com [198.144.209.5])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o51Fuk0t028970
	for <linux-lvm@redhat.com>; Tue, 1 Jun 2010 11:56:46 -0400
Message-ID: <4C052DBC.6040709@noir.com>
Date: Tue, 01 Jun 2010 08:56:44 -0700
From: "K. Richard Pixley" <rich@noir.com>
MIME-Version: 1.0
References: <AANLkTikmw8_d91zrpW9HFKz8d5XCkg-b8h_NdD3leR9u@mail.gmail.com>	(from
	romeo.theriault@maine.edu on Mon May 31 14:21:36
	2010)	<1275338712.1423.2@raydesk1.bettercgi.com>
	<A7A5455753145049A5860984ED9BFF5627598C6F19@GVW0547EXC.americas.hpqcorp.net>
In-Reply-To: <A7A5455753145049A5860984ED9BFF5627598C6F19@GVW0547EXC.americas.hpqcorp.net>
Content-Type: multipart/alternative;
	boundary="------------060803050601010502030807"
Subject: Re: [linux-lvm] Is it possible to bypass LVM and mount contained
 partition directly?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------060803050601010502030807
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

You might be able to make those partitions available using nbd from the 
server, importing them on the vms.

--rich

Hull, Brett (MSE) wrote:
> Hello,
>
>   Can you restore these backups to another system?  Such as one designated to do this job?  Maybe using a virtual machine? You could then create the environment restore the data and move the "recovered files" to the production box. I do not know your environment, but you might not want to change the backed up data because that is what you will use to restore if there is a full loss of data on your production system.
>
> Best regards,
> Brett
>
> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Ray Morris
> Sent: Monday, May 31, 2010 2:45 PM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] Is it possible to bypass LVM and mount contained partition directly?
>
>    In general, no, though in your specific case it may be
> that all of the extents are stored contigously and it might
> work. You would probably need to use losetup -o and specify
> the offset.  This would be more of a last ditch data recovery
> effort than something you'd design into a production system,
> though.
>
>    You might have better results altering one of these issues
> that is causing you to consider such action:
>
>   
>>  I can't import the pv/vg because they have the same name/uuid
>> as the existing VG (it's really the same system) and I can't change
>> them with something like vgimportclone because the backed up vm image
>> files are read-only.
>>     
>
>    In other words, you would back up to one of the following questions:
> How can I change the names and UUIDs of the backups?
> How can I import an LV which has a conflicting UUID?
> How can I use vgimport with a read only source?
>
>    Specifically, you might be able to ignore the meta data on
> the backup volumes with pvmetadatacopies  = 0 and use "dirs"
> in lvm.conf, so you can change the working meta data even
> though they are read only.
> --
> Ray Morris
> support@bettercgi.com
>
> Strongbox - The next generation in site security:
> http://www.bettercgi.com/strongbox/
>
> Throttlebox - Intelligent Bandwidth Control
> http://www.bettercgi.com/throttlebox/
>
> Strongbox / Throttlebox affiliate program:
> http://www.bettercgi.com/affiliates/user/register.php
>
>
> On 05/31/2010 02:21:36 PM, Romeo Theriault wrote:
>   
>> I apologize if this has been asked before but I was unable to find any
>> references to it in the mailing list archives and googling around
>> isn't helping much.
>>
>> Is there a way to directly mount, bypassing LVM, a ext3 partition that
>> resides in a LVM LV and VG? It resides on one PV.
>>
>> The problem is that I have read-only copies of VM's that are backed up
>> via a SAN based snapshot/backup tool. I'm trying to create a method to
>> allow the VM admins to restore their files from the snapshot backed up
>> VM's. I'm at the point where I can access the partitions and can mount
>> the ext3 partitions fine but I'm having trouble with the LVM volumes
>> because I can't import the pv/vg because they have the same name/uuid
>> as the existing VG (it's really the same system) and I can't change
>> them with something like vgimportclone because the backed up vm image
>> files are read-only.
>>
>> Thanks for any help.
>>
>> --
>> Romeo Theriault
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>
>>     
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>   

--------------060803050601010502030807
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#000000">
You might be able to make those partitions available using nbd from the
server, importing them on the vms.<br>
<br>
--rich<br>
<br>
Hull, Brett (MSE) wrote:
<blockquote
 cite="mid:A7A5455753145049A5860984ED9BFF5627598C6F19@GVW0547EXC.americas.hpqcorp.net"
 type="cite">
  <pre wrap="">Hello,

  Can you restore these backups to another system?  Such as one designated to do this job?  Maybe using a virtual machine? You could then create the environment restore the data and move the "recovered files" to the production box. I do not know your environment, but you might not want to change the backed up data because that is what you will use to restore if there is a full loss of data on your production system.

Best regards,
Brett

-----Original Message-----
From: <a class="moz-txt-link-abbreviated" href="mailto:linux-lvm-bounces@redhat.com">linux-lvm-bounces@redhat.com</a> [<a class="moz-txt-link-freetext" href="mailto:linux-lvm-bounces@redhat.com">mailto:linux-lvm-bounces@redhat.com</a>] On Behalf Of Ray Morris
Sent: Monday, May 31, 2010 2:45 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] Is it possible to bypass LVM and mount contained partition directly?

   In general, no, though in your specific case it may be
that all of the extents are stored contigously and it might
work. You would probably need to use losetup -o and specify
the offset.  This would be more of a last ditch data recovery
effort than something you'd design into a production system,
though.

   You might have better results altering one of these issues
that is causing you to consider such action:

  </pre>
  <blockquote type="cite">
    <pre wrap=""> I can't import the pv/vg because they have the same name/uuid
as the existing VG (it's really the same system) and I can't change
them with something like vgimportclone because the backed up vm image
files are read-only.
    </pre>
  </blockquote>
  <pre wrap=""><!---->
   In other words, you would back up to one of the following questions:
How can I change the names and UUIDs of the backups?
How can I import an LV which has a conflicting UUID?
How can I use vgimport with a read only source?

   Specifically, you might be able to ignore the meta data on
the backup volumes with pvmetadatacopies  = 0 and use "dirs"
in lvm.conf, so you can change the working meta data even
though they are read only.
--
Ray Morris
<a class="moz-txt-link-abbreviated" href="mailto:support@bettercgi.com">support@bettercgi.com</a>

Strongbox - The next generation in site security:
<a class="moz-txt-link-freetext" href="http://www.bettercgi.com/strongbox/">http://www.bettercgi.com/strongbox/</a>

Throttlebox - Intelligent Bandwidth Control
<a class="moz-txt-link-freetext" href="http://www.bettercgi.com/throttlebox/">http://www.bettercgi.com/throttlebox/</a>

Strongbox / Throttlebox affiliate program:
<a class="moz-txt-link-freetext" href="http://www.bettercgi.com/affiliates/user/register.php">http://www.bettercgi.com/affiliates/user/register.php</a>


On 05/31/2010 02:21:36 PM, Romeo Theriault wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">I apologize if this has been asked before but I was unable to find any
references to it in the mailing list archives and googling around
isn't helping much.

Is there a way to directly mount, bypassing LVM, a ext3 partition that
resides in a LVM LV and VG? It resides on one PV.

The problem is that I have read-only copies of VM's that are backed up
via a SAN based snapshot/backup tool. I'm trying to create a method to
allow the VM admins to restore their files from the snapshot backed up
VM's. I'm at the point where I can access the partitions and can mount
the ext3 partitions fine but I'm having trouble with the LVM volumes
because I can't import the pv/vg because they have the same name/uuid
as the existing VG (it's really the same system) and I can't change
them with something like vgimportclone because the backed up vm image
files are read-only.

Thanks for any help.

--
Romeo Theriault

_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>


    </pre>
  </blockquote>
  <pre wrap=""><!---->

_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>

_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>
  </pre>
</blockquote>
</body>
</html>

--------------060803050601010502030807--
