Return-Path: <axboe@brick.kernel.dk>
Date: Thu, 19 Apr 2001 23:51:07 +0200
From: Jens Axboe <axboe@suse.de>
Subject: Re: [linux-lvm] 2.4.3-ac{6,7} LVM hang
Message-ID: <20010419235107.G750@suse.de>
References: <Pine.LNX.4.21.0104161653140.14442-100000@imladris.rielhome.conectiva> <Pine.LNX.4.31.0104192311080.1048-100000@sjoerd.sjoerdnet>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.31.0104192311080.1048-100000@sjoerd.sjoerdnet>; from iafilius@xs4all.nl on Thu, Apr 19, 2001 at 11:13:49PM +0200
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
To: Arjan Filius <iafilius@xs4all.nl>
Cc: linux-lvm@sistina.com, linux-kernel@vger.kernel.org, linux-openlvm@nl.linux.org

--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 19 2001, Arjan Filius wrote:
> Hello,
> 
> Same here as reported.
> restoring lvm.c from 2.4.3 into 2.4.4-pre? "fixes" this. (tested not ac's
> kernel)

Does attached patch fix it?

-- 
Jens Axboe


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=lvm-244p4-1

--- /opt/kernel/linux-2.4.4-pre4/drivers/md/lvm.c	Wed Apr 18 14:37:34 2001
+++ drivers/md/lvm.c	Thu Apr 19 23:40:39 2001
@@ -1674,10 +1674,11 @@
 			       int rw,
 			       struct buffer_head *bh)
 {
-	int ret = lvm_map(bh, rw);
-	if (ret < 0)
-		buffer_IO_error(bh);
-	return ret;
+	if (lvm_map(bh, rw) >= 0)
+		return 1;
+
+	buffer_IO_error(bh);
+	return 0;
 }
 
 

--9jxsPFA5p3P2qPhR--
