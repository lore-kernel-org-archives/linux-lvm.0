Return-Path: <bs@infologic.fr>
Message-ID: <3A6DAE2B.D7E48966@infologic.fr>
Date: Tue, 23 Jan 2001 17:15:39 +0100
From: Benoit SERRA <bs@infologic.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] New dumb question
References: <3A6D73AB.FC7E1753@infologic.fr> <3A6DA541.E2F7280C@infologic.fr> <20010123155349.F556@tykepenguin.com>
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


Patrick Caulfield wrote:

> If you're doing striped LVs on top of software RAID I'm not really surprised.
> Pick one method of striping (LVM *or* RAID) and stick to it but don't mix them
> or who knows where your data will end up!
> 
> patrick

Software RAID is build in, but is not used. Nevermind !
I'm not using LVM on top of SOFTWARE RAID for the moment.
If I use LVM on top of SOFTWARE RAID, it will be for redudancy, not for
striping.

My kernel is a 2.4.0 patched for the reiserfs and online ext2 resizing.
