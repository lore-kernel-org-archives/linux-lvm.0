Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6JAFG1h028622
	for <linux-lvm@redhat.com>; Wed, 19 Jul 2006 06:15:16 -0400
Received: from dgate1.fujitsu-siemens.com (dgate1.fujitsu-siemens.com
	[217.115.66.35])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6JAF5hQ013619
	for <linux-lvm@redhat.com>; Wed, 19 Jul 2006 06:15:06 -0400
Received: from pdbzex0e.pdb.fsc.net (pdbzex0e.pdb.fsc.net [172.25.96.69])
	by plim.pdb.fsc.net (8.12.6/8.12.6/SuSE Linux 0.6) with ESMTP id
	k6JAF4Uv013169
	for <linux-lvm@redhat.com>; Wed, 19 Jul 2006 12:15:04 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] Error setting up a mirrored lv
Date: Wed, 19 Jul 2006 12:15:03 +0200
Message-ID: <D81E5F9261AA644D90FF7B8E400588173C6FB2@PDBEX02E.pdb.fsc.net>
In-Reply-To: <20060718225144.GA28146@percy.comedia.it>
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

so, what is the best way to mirror storage?

lvm ontop of multipath and mirrored lvs or
lvm ontop of md ontop of multipath

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
>> [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Luca Berra
>> Sent: Wednesday, July 19, 2006 12:52 AM
>> To: linux-lvm@redhat.com
>> Subject: Re: [linux-lvm] Error setting up a mirrored lv
>> 
>> On Tue, Jul 18, 2006 at 03:16:13PM -0400, Harik A'ttar wrote:
>> >As you noticed, you need a log partition.  dm-mirror is a 
>> bit smarter 
>> >then the basic MD raid1 in that it uses a log disk to keep track of 
>> >write completions for synchronization.  I've only recently 
>> got a kernel 
>> Just for fairness, modern md also supports bitmaps either on 
>> a different
>> device or inside the md components for this very purpose.
>> 
>> L.
>> 
>> -- 
>> Luca Berra -- bluca@comedia.it
>>         Communication Media & Services S.r.l.
>>  /"\
>>  \ /     ASCII RIBBON CAMPAIGN
>>   X        AGAINST HTML MAIL
>>  / \
>> 
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>> 
