From: jon+lvm@silicide.dk
Subject: Re: [linux-lvm] software mirroring
Message-ID: <20020911080049.GA28187@gw.silicide.dk>
References: <2100.24.46.54.254.1031670341.squirrel@mail.scottsavarese.com> <3D7E0CC0.D7B06D44@silicide.dk> <2951.24.46.54.254.1031678903.squirrel@mail.scottsavarese.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2951.24.46.54.254.1031678903.squirrel@mail.scottsavarese.com>
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
Date: Wed Sep 11 03:03:12 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Savarese <scott@scottsavarese.com>
Cc: jon+lvm@silicide.dk, linux-lvm@sistina.com

On Tue, Sep 10, 2002 at 01:28:23PM -0400, Scott Savarese wrote:
> Jon Bendtsen said:
> 
> > Do it from the hda boot prompt
> 
> Yeah...That worked....I then was able to boot into my /dev/hdc. However, I
> then completed the mirror to /dev/hda reran lilo and rebooted. Now it
> gives L 40 40 40 which is a Seek Failure (no solution given). Which means,
> that since I have no clean copy of data I need to start all over again.

Well, it MIGHT be an idea to take a backup first...
Anyway, since the data is still there, you should be able to use a
rescue floppy and get it started.

 
JonB
