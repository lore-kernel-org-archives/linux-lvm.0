Message-ID: <3EB2D2D8.B5114496@pittstate.edu>
From: Scott Parish <ssparish@pittstate.edu>
MIME-Version: 1.0
References: <20030430193030.AF83AAE4F5@basilica.la.naos.co.nz> <1051902402.4660.430.camel@cinshrlnxws01.shermfin.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM, GFS, and clustered mail servers
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
Date: Fri May  2 15:19:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

This is a little off the typical discussion found on the list, and I apologize
in advance for the slight interruption.

I'm looking for anyone who has used LVM and Sistina's GFS to implement a
clustered mail server environment using commodity PCs.   I use the term cluster
here, somewhat loosely, to describe multiple machines providing the same or
similar service(s), in this case mail services (pop, imap, webmail, smtp).  I'm
particularly interested in your use of LVM/GFS in implementing a shared mail
store/filesystem. 

If you have such a setup, and could spare a few moments, I'd like to pick your
brain on your cluster configuration and experiences.  Feel free to reply to the
list or directly.

Some of the things I'd like to know are:

Describe your config, number of machines, adapters, disk subsystems
(manufacturer would be helpful for adapters and disk subsystem).

Software you're using to provide mail services?  (sendmail, qmail, cyrus,
courier, squirrelmail, etc.)

How many users do you serve?

How did you decide to distribute workload?  RR DNS?  Split services among
machines?  Linux Virtual Server?  Something else?

Do you share more than the mail filesystem among machines?  If so, what?

Do you have any performance numbers?

What snags did you hit?

If you had to implement again, which would you choose:  "big box" or the
cluster?

Anything else you'd like to volunteer.

Thanks in advance,
Scott

--
Scott Parish, Systems Administrator, Pittsburg State University
Thinking is the hardest work there is, which is probably the 
reason why so few engage in it.  -  Henry Ford
