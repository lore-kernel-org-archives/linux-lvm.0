Message-ID: <134687340.1003941444401.JavaMail.root@boots>
From: "Karl" <rmvzj001@sneakemail.com>
Subject: Re: [linux-lvm] read_intr errors
Mime-Version: 1.0
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
Date: Wed Oct 24 11:36:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> Well that looks OK
>  
> > as you can see, no errors.  Now, having said that, I've come to realise that
> > the errors I get happen when accessing my tape drive (which is scsi) - at
> > least I think that's what's happening... weird.  do you then think this is
> > related to the problems others have had? and if so, was there a fix?
> 
> The thread about SCSI errors just stopped so I don't know what happened there.
> There was some thought that maybe LVM was trying to access beyond the end of the
> disk so you could check to see if the LV is using all the space on /dev/hdc and
> back it off a little so see if that helps. It may also be worth upgrading to
> LVM 1.0.1rc4.

I have not had a chance to try the last suggestion of seeing if I have
problems on an MD device. There has not yet been a solution to the SCSI based
problems.

-- 
Karl Hakimian
XXXXXXXXXXXXXXXX
