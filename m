Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Fri, 16 Mar 2001 08:58:39 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Message-ID: <20010316085839.B504@tykepenguin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
Subject: [linux-lvm] Re: 2.4.2 sparc64 patch for LVM
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


-- 

patrick


--fUYQa+Pmc3FrFX/N
Content-Type: message/rfc822
Content-Disposition: inline

Return-path: <davem@pizda.ninka.net>
Envelope-to: patrick@localhost
Delivery-date: Fri, 16 Mar 2001 08:28:57 +0000
Received: from localhost.pjc.net
	([127.0.0.1] helo=hermes.sistina.com ident=root)
	by tyke.pjc.net with esmtp (Exim 3.12 #1 (Debian))
	id 14dpbU-0000FC-00
	for <patrick@localhost>; Fri, 16 Mar 2001 08:28:56 +0000
Delivered-To: caulfield@sistina.com
Received: (qmail 14268 invoked from network); 16 Mar 2001 06:58:15 -0000
Received: from pizda.ninka.net (root@216.101.162.242)
  by hermes.sistina.com with SMTP; 16 Mar 2001 06:58:15 -0000
Received: (from davem@localhost)
	by pizda.ninka.net (8.9.3/8.9.3) id WAA09669;
	Thu, 15 Mar 2001 22:59:10 -0800
From: "David S. Miller" <davem@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <15025.47550.500340.458204@pizda.ninka.net>
Date: Thu, 15 Mar 2001 22:59:10 -0800 (PST)
To: Patrick Caulfield <caulfield@sistina.com>
Cc: linux-kernel@vger.kernel.org, linux-lvm@sistina.com
Subject: Re: 2.4.2 sparc64 patch for LVM
In-Reply-To: <20010313083541.A510@tykepenguin.com>
References: <20010313083541.A510@tykepenguin.com>
X-Mailer: VM 6.75 under 21.1 (patch 13) "Crater Lake" XEmacs Lucid


Patrick Caulfield writes:
 > The patch below fixes the ioctl32.c file so that LVM 0.9 will work
 > on UltraSPARC machines.

I've added this patch to my tree, thanks.

Later,
David S. Miller
davem@redhat.com

--fUYQa+Pmc3FrFX/N--
