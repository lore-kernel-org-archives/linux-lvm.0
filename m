Return-Path: <stevecranage@earthlink.net>
Message-ID: <3B01D28F.6FBB5BDD@earthlink.net>
Date: Tue, 15 May 2001 19:06:23 -0600
From: Steve Cranage <stevecranage@earthlink.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to read internal physical volume number.
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
To: linux-lvm@sistina.com

I have a configuration with multiple paths to each pv, and need to sort
them out so I know which device names are alternate paths to the same
physical device. I had planned on using the internal serial number
written to the pv's  when a pvcreate is done.

The man pages for pvdisplay seem to indicate this is in the 4th field of
the output with the -c option, but alas, the -c option appears to not be
coded as it doesn't affect the output of the pvdisplay command. How else
can I get the internal serial number?
TIA
