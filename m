Return-Path: <harvell@nortelnetworks.com>
Message-ID: <3A746B67.4FA4CD18@nortelnetworks.com>
Date: Sun, 28 Jan 2001 12:56:39 -0600
From: "Joe Harvell" <harvell@nortelnetworks.com>
MIME-Version: 1.0
Subject: [linux-lvm] Follow-up 2: Help: lvm 0.9.1_beta3 oops (can't get my data)
Content-Transfer-Encoding: 7bit
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

When I do a 'vgdisplay -vD w0', I don't run into any problems.  Does this rule out the possibility of a vgcfgrestore helping?

I looked at the man pages for vcfgrestore, but I don't know which destination I should specify.  Is it /dev/w0, or is it 'dev/hda8' and '/dev/hdb3'?
