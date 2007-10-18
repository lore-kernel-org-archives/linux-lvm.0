Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9IG2cHD016763
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2007 12:02:38 -0400
Received: from e2.ny.us.ibm.com (e2.ny.us.ibm.com [32.97.182.142])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9IG2Vrh024582
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2007 12:02:31 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e2.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id l9IG2Nc1024857
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2007 12:02:23 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v8.5) with ESMTP id
	l9IG2FLl107920
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2007 12:02:23 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l9IG25fu025913
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2007 12:02:05 -0400
Date: Thu, 18 Oct 2007 09:01:45 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] very slow fw performance when snapshots active
Message-ID: <20071018160145.GA14967@us.ibm.com>
References: <1A2D7011B6705B449F66B36B232097C07A7597@x1.ads.i-dmedia.com>
	<47177953.4020008@oxeva.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <47177953.4020008@oxeva.fr>
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
To: Gabriel Barazer <gabriel@oxeva.fr>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Reducing chunksize may help a bit but you may end up having
performance problems when you read snapshot data later.

Thanks, Malahal.

Gabriel Barazer [gabriel@oxeva.fr] wrote:
> On 10/18/2007 4:01:40 PM +0200, "Zurell, Falko" 
> <Falko.Zurell@idmedia.com> wrote:
> >Ok, i understand the point with the swap file of vi. But why is this 
> >with snapshots activated that much slower than without?
> >Why can the file be saved in seconds without cow instead of about 2 
> >minutes with cow. Needing twice the time for saving would be reasonable.
> 
> I think this is because the re-writing operation on a standard block 
> device is done using a comparison between the data to write, and the 
> data already written (which is nearly all the time read from the OS file 
> cache in your test case, instead of the block device itself, because the 
> file written was entirely read just before) whereas the LVM snapshot 
> target redirect any write to the COW space without this comparison step. 
> Maybe there is a possible optimization of the snapshot dm target which 
> could compare block before deciding to write them on the COW space. 
> Obvisouly, such optimization process add a slight overhead an can 
> possibly have a negative impact on the performance.
> 
> Gabriel
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
