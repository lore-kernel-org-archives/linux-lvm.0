Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kA2M2wbY018416
	for <linux-lvm@redhat.com>; Thu, 2 Nov 2006 17:02:58 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kA2M2uT7030067
	for <linux-lvm@redhat.com>; Thu, 2 Nov 2006 17:02:56 -0500
Date: Thu, 2 Nov 2006 23:02:55 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Incorrect metadata area header checksum
Message-ID: <20061102220255.GA1486@percy.comedia.it>
References: <5485940d0611020538r41620b3cr3356ac214f0ba2e2@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5485940d0611020538r41620b3cr3356ac214f0ba2e2@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Nov 02, 2006 at 01:38:22PM +0000, C'est Pierre wrote:
>Not of the disks is fully used, yet I can't even write to /root
>
># >foobar
>-bash: foobar: No space left on device
>
maybe you are out of inodes?
try checking with df -i

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
