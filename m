Message-Id: <20020228105951.26555.qmail@web13004.mail.yahoo.com>
From: Prashant Kharche <pdkharche@yahoo.com>
Subject: Re: [linux-lvm] Cluster LVM
In-Reply-To: <200202281024.LAA26544@mailgate.sara.nl>
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
Date: Thu Feb 28 04:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

we have studied the DLM of IBM and basically we are
impleneting a similar concept.we have a lock manger
daemon at the administartor and a client daemon at the
nodes.The main aim is to maintain the consistency of
the metadata.When tools are run they run with a lock
and and at that time the filesystem cannot access the
volume groups.
also at the release of lock vgscan at all nodes leads
to the updation of the metadata.

Prashant




--- Remco Post <r.post@sara.nl> wrote:
> 
> > The VG being locked is not _that_ terrible - after
> all - you only need
> > this to change your storage configuration (I don't
> expet the LVM to
> > actually lock access to the device).
> 
> What happens with a lvextend? I guess it's perfectly
> possible to extend an lv while the other node(s) in
> the cluster are accessing it. Or are ther any
> problems? Problems that arise during the fs-grow
> operation are up to the fs anyway, right?
> 
> 
> -- 
> Met vriendelijke groeten,
> 
> Remco Post
> 
> SARA - Stichting Academisch Rekencentrum Amsterdam
> High Performance Computing  Tel. +31 20 592 8008   
> Fax. +31 20 668 3167
> 
> "I really didn't foresee the Internet. But then,
> neither did the computer
> industry. Not that that tells us very much of course
> - the computer industry
> didn't even foresee that the century was going to
> end." -- Douglas Adams
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

__________________________________________________
Do You Yahoo!?
Yahoo! Greetings - Send FREE e-cards for every occasion!
http://greetings.yahoo.com
