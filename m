Return-Path: <mbp@valinux.com>
Date: Fri, 27 Jul 2001 18:57:05 +1000
From: Martin Pool <mbp@valinux.com>
Subject: Re: [linux-lvm] File System type on (LVM) partition
Message-ID: <20010727185703.A13520@valinux.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5.0.2.1.2.20010727102408.00a35ec0@127.0.0.1>
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

On 27 Jul 2001, Benoit SERRA <bs@infologic.fr> wrote:
> At 27/07/01, you wrote:
> >  is there a way to know the file system type installed on a partition
> >(wich could be of LVM type or not)
> >  tanx for your help.

Either run 'mount', as suggested, or do 

  # file -sL /dev/hda1

-- 
Martin

The search for the perfect martini is a fraud.  The perfect martini is
a belt of gin from the bottle; anything else is the decadent trappings
of civilization.
		-- T.K.
