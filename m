Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6D8hG8k013190
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 04:43:16 -0400
Received: from dgate2.fujitsu-siemens.com (dgate2.fujitsu-siemens.com
	[217.115.66.36])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6D8h7Wm026504
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 04:43:08 -0400
Received: from pdbzex0e.pdb.fsc.net (pdbzex0e.pdb.fsc.net [172.25.96.69])
	by plim.pdb.fsc.net (8.12.6/8.12.6/SuSE Linux 0.6) with ESMTP id
	k6D8gf2S010459
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 10:42:43 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] Mirror of LVs
Date: Thu, 13 Jul 2006 10:42:43 +0200
Message-ID: <D81E5F9261AA644D90FF7B8E4005881737BF0C@PDBEX02E.pdb.fsc.net>
In-Reply-To: <D81E5F9261AA644D90FF7B8E4005881737BE56@PDBEX02E.pdb.fsc.net>
From: "Laurenz, Dirk" <Dirk.Laurenz@fujitsu-siemens.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

what i found out ist to use the lvcreate command.
But why are three pvs needed?

I want to mirror 2 400 GB volumes. 
How big must the log pv be?

Mit freundlichem Gruss,

Dirk Laurenz
Systems Engineer
S DE SE PS N/O
Fujitsu Siemens Computers GmbH
Hildesheimer Strasse 25
30880 Laatzen
Germany

Telephone:	+49 511 84 89 18 08
Telefax:	+49 511 84 89 25 18 08
Mobile:	+49 170 22 10 78 1 
Email:	mailto: dirk.laurenz@fujitsu-siemens.com
Internet:	http://www.fujitsu-siemens.com
 

>> -----Original Message-----
>> From: linux-lvm-bounces@redhat.com 
>> [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Laurenz, Dirk
>> Sent: Thursday, July 13, 2006 9:52 AM
>> To: LVM general discussion and development
>> Subject: RE: [linux-lvm] Mirror of LVs
>> 
>> and how do i do this ?
>> 
>> Mit freundlichem Gruss,
>> 
>> Dirk Laurenz
>> Systems Engineer
>> S DE SE PS N/O
>> Fujitsu Siemens Computers GmbH
>> Hildesheimer Strasse 25
>> 30880 Laatzen
>> Germany
>> 
>> Telephone:	+49 511 84 89 18 08
>> Telefax:	+49 511 84 89 25 18 08
>> Mobile:	+49 170 22 10 78 1 
>> Email:	mailto: dirk.laurenz@fujitsu-siemens.com
>> Internet:	http://www.fujitsu-siemens.com
>>  
>> 
>> >> -----Original Message-----
>> >> From: linux-lvm-bounces@redhat.com 
>> >> [mailto:linux-lvm-bounces@redhat.com] On Behalf Of 
>> Jonathan E Brassow
>> >> Sent: Friday, July 07, 2006 3:50 PM
>> >> To: LVM general discussion and development
>> >> Subject: Re: [linux-lvm] Mirror of LVs
>> >> 
>> >> Although the code is largely out there, I haven't heard 
>> >> anyone testing 
>> >> it on SUSE.  (I have heard gentoo, debian, and red hat, I think.)
>> >> 
>> >>   brassow
>> >> 
>> >> On Jul 4, 2006, at 3:17 AM, Laurenz, Dirk wrote:
>> >> 
>> >> > Hi,
>> >> >
>> >> > ist it possible to mirror a lv or a pv with dm or lvm2 in 
>> >> sles9 sp3?
>> >> >
>> >> > Mit freundlichem Gruss,
>> >> >
>> >> > Dirk Laurenz
>> >> > Systems Engineer
>> >> > S DE SE PS N/O
>> >> > Fujitsu Siemens Computers GmbH
>> >> > Hildesheimer Strasse 25
>> >> > 30880 Laatzen
>> >> > Germany
>> >> >
>> >> > Telephone:	+49 511 84 89 18 08
>> >> > Telefax:	+49 511 84 89 25 18 08
>> >> > Mobile:	+49 170 22 10 78 1
>> >> > Email:	mailto: dirk.laurenz@fujitsu-siemens.com
>> >> > Internet:	http://www.fujitsu-siemens.com
>> >> >
>> >> > _______________________________________________
>> >> > linux-lvm mailing list
>> >> > linux-lvm@redhat.com
>> >> > https://www.redhat.com/mailman/listinfo/linux-lvm
>> >> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>> >> >
>> >> 
>> >> _______________________________________________
>> >> linux-lvm mailing list
>> >> linux-lvm@redhat.com
>> >> https://www.redhat.com/mailman/listinfo/linux-lvm
>> >> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>> >> 
>> 
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>> 
