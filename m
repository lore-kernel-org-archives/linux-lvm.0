Return-Path: <bs@infologic.fr>
Message-ID: <3A6DA541.E2F7280C@infologic.fr>
Date: Tue, 23 Jan 2001 16:37:37 +0100
From: Benoit SERRA <bs@infologic.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] New dumb question
References: <3A6D73AB.FC7E1753@infologic.fr>
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

I build it into the kernel with the 2940 driver, reiserfs and the
software raid (I don't like to have critical drivers as modules)

Stripped LV and NonStripped LVs reported the same bonnie++ result. Is it
normal ?

I'm using 3 2.2 Gb SCSI drives on a 2940. One is for the system, the 2
others are for the LVM. I let the default stripe size, and the default
PE size.
