Return-Path: <g.liakhovetski@ragingbull.com>
Date: Tue, 17 Jul 2001 12:28:07 +0100 (BST)
From: Guennadi Liakhovetski <g.liakhovetski@ragingbull.com>
Subject: Re: [linux-lvm] HUGE LVM log file...
In-Reply-To: <20010717131430.A17345@sistina.com>
Message-ID: <Pine.LNX.4.31.0107171225320.12608-100000@erdos.shef.ac.uk>
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
To: linux-lvm@sistina.com

> > My /var/log/lvm has grown up to 800MB+... and has filled up the disk...
>
> Remove it.
> lvmsadc is probably filling it run by cron.

Thanks! But why / what for is it needed and why is it created by default
without any size control?

Guennadi
___

Dr. Guennadi V. Liakhovetski
Department of Applied Mathematics
University of Sheffield, Sheffield, U.K.
email: g.liakhovetski@sheffield.ac.uk
