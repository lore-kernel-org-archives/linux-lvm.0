Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Tue, 23 Jan 2001 15:53:50 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] New dumb question
Message-ID: <20010123155349.F556@tykepenguin.com>
References: <3A6D73AB.FC7E1753@infologic.fr> <3A6DA541.E2F7280C@infologic.fr>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3A6DA541.E2F7280C@infologic.fr>; from bs@infologic.fr on Tue, Jan 23, 2001 at 04:37:37PM +0100
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

On Tue, Jan 23, 2001 at 04:37:37PM +0100, Benoit SERRA wrote:
> I build it into the kernel with the 2940 driver, reiserfs and the
> software raid (I don't like to have critical drivers as modules)
> 
> Stripped LV and NonStripped LVs reported the same bonnie++ result. Is it
> normal ?

If you're doing striped LVs on top of software RAID I'm not really surprised.
Pick one method of striping (LVM *or* RAID) and stick to it but don't mix them 
or who knows where your data will end up!


patrick
