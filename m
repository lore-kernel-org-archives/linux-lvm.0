Return-Path: <Dominique.Larchey-Wendling@loria.fr>
Message-ID: <3B10B023.E140C22E@loria.fr>
Date: Sun, 27 May 2001 09:43:31 +0200
From: Dominique LARCHEY-WENDLING <Dominique.Larchey-Wendling@loria.fr>
MIME-Version: 1.0
Subject: Re: System goes very slow (was: Re: [linux-lvm] Test of LVM)
References: <01052614354500.00527@notch> <20010526154903.A1477@dardhal.mired.net> <01052704562400.02599@notch>
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

> root@notch:/home/pwk > bonnie -s 1024MB
> Bonnie 1.2: File './Bonnie.2815', size: 1073741824, volumes: 1
> Writing with putc()...          done:   3270 kB/s  35.4 %CPU
> Rewriting...                    done:   1505 kB/s  19.3 %CPU
> Writing intelligently...        done:   4682 kB/s  11.4 %CPU
> [I stopped bonnie here, do you need more output ?]

Is DMA set on your harddrive ? (hdparm)

DL

-- 
Dominique Larchey
LORIA, Nancy, France
Tel. (Work) +33 (0) 3 83 59 20 13
