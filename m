Return-Path: <paul@clubi.ie>
Date: Fri, 5 Jan 2001 03:56:46 +0000 (GMT)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] LVM 0.9 vgscan problem
In-Reply-To: <Pine.LNX.4.21.0101041545590.1281-300000@duckman.distro.conectiva>
Message-ID: <Pine.LNX.4.30.0101050353430.31107-100000@fogarty.jakma.org>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rik van Riel <riel@conectiva.com.br>
Cc: linux-lvm@sistina.com

On Thu, 4 Jan 2001, Rik van Riel wrote:

> Any chance this stuff gets fixed so I can go on testing
> (fixing?) the 2.4 VM?  ;)

easy matter to strip the LVM update out of the 2.4.0-pre patch as it
only touches LVM files:

[root@hibernia /root]# uname -r ;  cat /proc/lvm | grep LVM
2.4.0-prerelease
LVM driver version 0.8final  (15/02/2000)

Don't think it was a good idea to update to 0.9 in Linus kernel.

regards,
-- 
Paul Jakma	paul@clubi.ie	paul@jakma.org
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
"Protozoa are small, and bacteria are small, but viruses are smaller
than the both put together."
