Date: Tue, 21 Nov 2000 13:57:10 -0200 (BRDT)
From: Rik van Riel <riel@conectiva.com.br>
Subject: Re: [linux-lvm] lvm and quotas on SuSE 7.0
In-Reply-To: <974814963.3a1a7ef34be1a@rumms.uni-mannheim.de>
Message-ID: <Pine.LNX.4.21.0011211355490.31692-100000@duckman.distro.conectiva>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Janson Benjamin <janson@rumms.uni-mannheim.de>
Cc: linux-lvm@msede.com, linux-fsdevel@vger.kernel.org

On Tue, 21 Nov 2000, Janson Benjamin wrote:

> Well my SuSE 7.0 linux box is setup with lvm and ext2 as
> underlying filesystem. But the problem is, that the quotas don't
> work. I can define quotas with edquota, but the system seems to
> be unable to recongnize how much space is used by the specified
> user.

> Without the lvm it worked.

I've seen this too...

Since LVM is pretty much invisible to the filesystem,
could this be something with the quota utilities being
confused by LVM ?

(or is it the filesystem after all?)

regards,

Rik
--
Hollywood goes for world dumbination,
	Trailer at 11.

http://www.conectiva.com/		http://www.surriel.com/
