Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oBHLCAFo008740
	for <linux-lvm@redhat.com>; Fri, 17 Dec 2010 16:12:10 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oBHLBvV3021767
	for <linux-lvm@redhat.com>; Fri, 17 Dec 2010 16:11:58 -0500
Received: from sdg.bmsi.com ([192.168.9.34]) (authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id oBHLBuAw019024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 17 Dec 2010 16:11:57 -0500
Message-ID: <4D0BD21C.20003@bmsi.com>
Date: Fri, 17 Dec 2010 16:11:56 -0500
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <4D0B9D71.3080602@gmail.com>	<AANLkTin8CfZhNGoA_DcMkgaCFtpp_OMMoXTV7X1DfNHv@mail.gmail.com>
	<4D0BC824.1010308@gmail.com>
In-Reply-To: <4D0BC824.1010308@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Conflicting vg names but can't rename one
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
To: linux-lvm@redhat.com

On 12/17/2010 03:29 PM, Mauricio Tavares wrote:
>
> raub@ubuntu:~$ sudo vgchange -an SB3NfW-swQM-5rdw-xf5e-z6At-r5DM-dUwG7D
>   WARNING: Duplicate VG name export: Existing 
> fjM9qy-aCEM-iluj-yTdQ-CwT5-Iijk-uOYXlB (created here) takes precedence 
> over SB3NfW-swQM-5rdw-xf5e-z6At-r5DM-dUwG7D
>   Volume group "SB3NfW-swQM-5rdw-xf5e-z6At-r5DM-dUwG7D" not found
> raub@ubuntu:~$
>
> Maybe I need to unmount/disconnect the hard drive with the vg being 
> used and then try to rename the other drive...
There is a vgimportclone script posted to this list, and added to recent 
LVM sources, that handles the situation where the UUID is also identical 
(due to hardware cloning).  Since you have distinct UUIDs, there is 
something we are all missing.
