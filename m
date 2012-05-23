Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4NMiTOL004831
	for <linux-lvm@redhat.com>; Wed, 23 May 2012 18:44:29 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4NMiSQT028455
	for <linux-lvm@redhat.com>; Wed, 23 May 2012 18:44:29 -0400
Received: from sdg.bmsi.com (sdg.bmsi.com [192.168.9.34] (may be forged))
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id q4NMiRX8030522
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 23 May 2012 18:44:28 -0400
Message-ID: <4FBD684B.4040309@bmsi.com>
Date: Wed, 23 May 2012 18:44:27 -0400
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
	<4FBBD376.7070001@bmsi.com>
	<CAGQjrKYeeG4Bwifh3yno46P3BDe9grbz8Um6mZqpcst5Eh7JaA@mail.gmail.com>
In-Reply-To: <CAGQjrKYeeG4Bwifh3yno46P3BDe9grbz8Um6mZqpcst5Eh7JaA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Fun and games with mirroring
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

On 05/22/2012 02:39 PM, tariq wali expounded in part:
> if I may ask an elementary question please :) I normally take a 
> snapshot on lvm partition offcourse that contains MySQL data say /data 
> and then mount it as ro and then use the ancient tar/scp to copy it 
> elsewhere . Could anyone please correct me if there is a better way to 
> do it ? like can i take  a snapshot of /data and transfer the entire 
> volume to another system ( i mean duplicate/mirror it ) ?
Yes
>
> sometime /data contains data that I really don't need to be in the 
> snapshot but the way i take snapshot it pretty much creates a mirror 
> .. I have always wondered how snapshot thing works because when i take 
> snapshot I continue to use my original /data and continue to do IO on 
> it while snapshot is mounted :)
>
Writes to the original volume cause the original data to be copied to 
the snapshot volume first.  Reads from the snapshot check for the block 
in the snapshot volume, and if not there read it from the original 
volume.  Thus, each first time logical write to a block on the original 
volume results in a read,write,write - and performance could tank if you 
are doing too many of these.
