From: Dan Sully <daniel@electricrain.com>
Message-ID: <20040111090130.GB4825@electricrain.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] No VFS-lock under 2.6.x ?
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
Date: Sun Jan 11 04:02:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

To my surprise, when attempting to do a live snapshot of a XFS filesystem on
2.6.1, it failed miserably, and caused the machine to spin out of control,
denying access to the main filesystems.

I couldn't find a patch on the net anywhere.

What is the state of VFS locking on 2.6.x?

And in a related question, is the 2.4.xx patch ever going to be integrated
into the mainline kernel? This is getting silly now.

Thanks.

-D
-- 
Begin the unnecessarily slow-moving dipping mechanism!
