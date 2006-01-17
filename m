Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k0HM8KDK003415
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2006 22:08:20 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Eyz00-0000um-6t
	for linux-lvm@redhat.com; Tue, 17 Jan 2006 22:08:20 +0000
Date: Tue, 17 Jan 2006 22:08:20 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Strange reduction in Total PE upon multiple
	vgreduce+vgextend
Message-ID: <20060117220820.GV4346@agk.surrey.redhat.com>
References: <D486606E7AD20947BDB7E56862E04C390185A285@cvo1.cvo.roguewave.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D486606E7AD20947BDB7E56862E04C390185A285@cvo1.cvo.roguewave.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Jan 17, 2006 at 10:38:11AM -0800, Poul Petersen wrote:
> 	Notice that sdp1 now only has 468 PEs. I lose one PE everytime I
> vgreduce/vgextend:
    
> # vgdisplay --version
>   LVM version:     2.01.08 (2005-03-22)
>   Library version: 1.01.02 (2005-05-17)
>   Driver version:  4.4.0

WHATS_NEW:
  Version 2.01.10 - 3rd May 2005
  ==============================
...
    Reinstate full PV size when removing from VG.


Alasdair
-- 
agk@redhat.com
