Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Thu, 8 Feb 2001 10:06:48 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] the curious case of the semi-created Logical Volume
Message-ID: <20010208100648.C529@tykepenguin.com>
References: <m21ytase6y.fsf_-_@andy.off.redeye.com> <20010208093123.B529@tykepenguin.com> <m2lmrhecgj.fsf@andy.off.redeye.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m2lmrhecgj.fsf@andy.off.redeye.com>; from andy@redeye.com on Thu, Feb 08, 2001 at 09:44:12AM +0000
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

On Thu, Feb 08, 2001 at 09:44:12AM +0000, Andy Cowling wrote:
>     Patrick> Can you do a lvdisplay -v on the volume so we can see
>     Patrick> just why LVM thinks it is inactive please ?
> 
> I do not have any 'lv01.conf' or 'lv02.conf' in /etc/lvmconf. Is this
> related ? Note I've called my VG's 'pv01' and 'pv01' because I'm stupid  :-)
> 
> # ls /etc/lvmconf
> pv01.conf        pv01.conf.4.old  pv2a.conf        pv2a.conf.4.old
> pv01.conf.1.old  pv02.conf        pv2a.conf.1.old  pv3a.conf
> pv01.conf.2.old  pv02.conf.1.old  pv2a.conf.2.old
> pv01.conf.3.old  pv02.conf.2.old  pv2a.conf.3.old
> 
> Here's the output of 'lvdisplay -v'
> I'll willingly provide any other command output...

Sorry, I meant lvdisplay -d (note no -D). Stupidity is contagious :-) 

patrick
