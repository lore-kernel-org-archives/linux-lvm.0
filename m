Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
Subject: Re: [linux-lvm] vgchange -a y /dev/System fails
References: <20020125233533.GK26045@merlins.org>
In-Reply-To: <20020125233533.GK26045@merlins.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16ViXz-0001vP-00@hermes.sistina.com>
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
Date: Tue Jan 29 18:25:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

A little while ago I had the same problems - the only way i could get around 
it  was using 2.4.16-xfs.  I was using 2.4.17-xfs+lvm (1.0.1) and when a 
snapshot failed I couldn't remove it and when I rebooted the system would 
hang.  By having a 2.4.16-xfs kernel with lvm-1.0.1rc4(ish) it would fix the 
problems on the fly during bootup and all was happy.  YMMV  At the time I did 
ask the mailling list why 2.4.16-xfs was more robust than 2.4.17-xfs+lvm; 
however, I never recieved an answer.

Heady

On Sat, 26 Jan 2002 09:35, you wrote:
> It fails and says:
> parameter error setting up snapshot copy on write exception
>
> So yes, I have  snapshots in there, but I can't delete  the snapshots if
> the volume isn't active, and I can't activate the volume because of a
> snapshot.
>
> To make things worse, /dev/System contains /usr and /var.
>
> The snapshots were created with 1.0.1rc4 on 2.4.14 and I now run 2.4.17
> with 1.0.1rc4-ish
>
> What's the magic override I need to use to make the volume active again?
>
> Thanks
> Marc

-- 
Adrian Head

(Public Key available on request.)
