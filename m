Return-Path: <tack@orion.dok.org>
Date: Tue, 14 Aug 2001 17:11:59 -0400
From: Jason Tackaberry <tack@linux.com>
Message-ID: <20010814171159.B28266@linux.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Adding a mirror after-the-fact
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I know this isn't strictly an LVM question, but ...

Suppose I have a volume group with 1 physical volume, say a 9GB disk.
Now, after some time, I decide I want to mirror this VG with another 9GB
disk.  What options do I have?  AFAICS, the only way to do this would be
to start from scratch?  This is a pretty simple and presumably common
thing to want to do, so I hope I'm wrong.  :)

Cheers,
Jason.
