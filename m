Return-Path: <markv@wave.co.nz>
Date: Fri, 4 May 2001 13:59:49 +1200
From: Mark van Walraven <markv@wave.co.nz>
Subject: Re: [linux-lvm] LVM Questions
Message-ID: <20010504135949.C20108@mail.wave.co.nz>
References: <20010503004851.897.qmail@web10803.mail.yahoo.com> <Pine.LNX.4.33.0105030540170.21066-100000@chasqui.LaRed.net.pe>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.33.0105030540170.21066-100000@chasqui.LaRed.net.pe>; from Carlo Marcelo Arenas Belon on Thu, May 03, 2001 at 06:41:39AM -0500
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

On Thu, May 03, 2001 at 06:41:39AM -0500, Carlo Marcelo Arenas Belon wrote:
> what is recommended is this patch on /etc/rc.d/init.d/halt to add the
> vgscan -n call, but is not really needed AFAIK

How important is "/sbin/vgchange" -a n at shutdown?  It seems a bad idea
if / is on an LV ...

Mark.
