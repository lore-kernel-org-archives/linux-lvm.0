Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9IFIvjg019115
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2007 11:18:57 -0400
Received: from mail.reagi.com (mail.reagi.com [195.60.188.80])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9IFIosD026935
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2007 11:18:50 -0400
Message-ID: <47177953.4020008@oxeva.fr>
Date: Thu, 18 Oct 2007 17:18:43 +0200
From: Gabriel Barazer <gabriel@oxeva.fr>
MIME-Version: 1.0
Subject: Re: AW: Re: [linux-lvm] very slow fw performance when snapshots active
References: <1A2D7011B6705B449F66B36B232097C07A7597@x1.ads.i-dmedia.com>
In-Reply-To: <1A2D7011B6705B449F66B36B232097C07A7597@x1.ads.i-dmedia.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 10/18/2007 4:01:40 PM +0200, "Zurell, Falko" 
<Falko.Zurell@idmedia.com> wrote:
> Ok, i understand the point with the swap file of vi. But why is this 
> with snapshots activated that much slower than without?
> Why can the file be saved in seconds without cow instead of about 2 
> minutes with cow. Needing twice the time for saving would be reasonable.

I think this is because the re-writing operation on a standard block 
device is done using a comparison between the data to write, and the 
data already written (which is nearly all the time read from the OS file 
cache in your test case, instead of the block device itself, because the 
file written was entirely read just before) whereas the LVM snapshot 
target redirect any write to the COW space without this comparison step. 
Maybe there is a possible optimization of the snapshot dm target which 
could compare block before deciding to write them on the COW space. 
Obvisouly, such optimization process add a slight overhead an can 
possibly have a negative impact on the performance.

Gabriel
