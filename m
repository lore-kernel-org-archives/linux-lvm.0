Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i57Eta026930
	for <linux-lvm@redhat.com>; Mon, 7 Jun 2004 10:55:36 -0400
Received: from gw-eur4.philips.com (gw-eur4.philips.com [161.85.125.10])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i57EtUXn031179
	for <linux-lvm@redhat.com>; Mon, 7 Jun 2004 10:55:30 -0400
Received: from smtpscan-eur6.philips.com (smtpscan-eur6.mail.philips.com
	[130.144.57.169])
	by gw-eur4.philips.com (Postfix) with ESMTP id 15C9D497B2
	for <linux-lvm@redhat.com>; Mon,  7 Jun 2004 14:55:24 +0000 (UTC)
Received: from smtpscan-eur6.philips.com (localhost [127.0.0.1])
	by localhost.philips.com (Postfix) with ESMTP id DB4821C2
	for <linux-lvm@redhat.com>; Mon,  7 Jun 2004 14:55:22 +0000 (GMT)
Received: from smtprelay-eur2.philips.com (smtprelay-eur2.philips.com
	[130.144.57.171])
	by smtpscan-eur6.philips.com (Postfix) with ESMTP id 6D4F71B7
	for <linux-lvm@redhat.com>; Mon,  7 Jun 2004 14:55:22 +0000 (GMT)
Received: from ehvrmh02.diamond.philips.com (ehvrmh02-srv.diamond.philips.com
	[130.139.27.125]) 
	by smtprelay-eur2.philips.com (8.9.3p3/8.9.3-1.2.2m-20040401) with
	ESMTP id OAA19843
	for <linux-lvm@redhat.com>; Mon, 7 Jun 2004 14:55:22 GMT
From: darren.miller@philips.com
Subject: Re: [linux-lvm] can't create snapshot on FC2
Message-ID: <OFB3B93F34.7282C4AF-ON80256EAC.0051AE72-80256EAC.0051F863@philips.com>
Date: Mon, 7 Jun 2004 15:53:41 +0100
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>





Yes I am using it in production.

However I am also using a SGI XFS Development Kernel from their CVS, which
meant that I only added in parts specifically required for snapshots and
nothing else.  some of which I had to manually put in from the .rej files.

But it's all working great.

Daz
==============================================================================

Darren Miller
Principal Systems Support Engineer
Microsoft Certified Professional
SCO Advanced Certified Engineer
Infomation Systems Department (Core Server Support)
Philips Semiconductors,Milbrook Industrial Estate,Southampton,SO15
0DJ,England
Direct Dial In: +44 (0) 2380 312681


|---------+---------------------------->
|         |                            |
|         |                            |
|         |                            |
|         |                            |
|         |                            |
|         |    Yedidia Klein           |
|         |    <yedidia@jct.ac.il>     |
|         |                            |
|         |    Sent by:                |
|         |    linux-lvm-bounces@redhat|
|         |    .com                    |
|         |                            |
|         |    07/06/2004 15:25        |
|         |    Please respond to LVM   |
|         |    general discussion and  |
|         |    development             |
|         |                            |
|---------+---------------------------->
  >----------------------------------------------------------------------------------------------------------------------|
  |                                                                                                                      |
  |           To:   LVM general discussion and development <linux-lvm@redhat.com>                                        |
  |           cc:   (bcc: Darren Miller/SOU/SC/PHILIPS)                                                                  |
  |           Subject:    Re: [linux-lvm] can't create snapshot on FC2                                                   |
  |                                                                                                                      |
  |           Classification:                                                                                            |
  |                                                                                                                      |
  |                                                                                                                      |
  >----------------------------------------------------------------------------------------------------------------------|




Alasdair G Kergon wrote:

>On Sun, Jun 06, 2004 at 05:45:22PM +0300, Yedidia Klein wrote:
>
>
>>I'm trying to create snapshot on lvm2 rinning on a fresh Fedora Core 2
>>linux machine
>>
>>
>
>Fedora doesn't include kernel support for snapshots/mirrors yet.
>
>To use them you'd need to patch your kernel.
>  http://sources.redhat.com/dm/
>
>Alasdair
>
>
tnx,
Is anyone using lvm2 snapshot in productions ?
I would like to use it w/ a storage system - is it ready for production ??

--Yedidia Klein
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
