Message-ID: <3E42C2F0.8000407@motorola.com>
From: Tom Georgoulias <tom.georgoulias@motorola.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] cannot create a volume group named the same as one
 already removed
References: <3E4295C1.9010802@motorola.com> <20030206193834.A23955@sistina.com>
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
Date: Thu Feb  6 14:19:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Heinz J . Mauelshagen wrote:
> Your mail doesn't show clearly, if vgremove was run prior to pvcreate.

I believe I did them out of order, which got me into this mess. :(

> The directory in /dev/ still exists so run:
> 
> rm -r /dev/volgrp2
> 
> and retry.

Thank you, that solved the problem.

Tom
