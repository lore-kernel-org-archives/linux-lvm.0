From: neuron <neuron@hollowtube.mine.nu>
Message-Id: <20031114132620.5e261cc3.neuron@hollowtube.mine.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Performance problem.
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
Date: Fri Nov 14 06:28:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I've had lvm running on my server for quite a while now, not sure if this problem has always been there, or if it just occured.

If I through smb listen to music, and then on the server rm a file about 500mb in size, the music will stop.  Now this is just an example, it's like the entire filesystem stops while removing the file.  Running reiserfs ontop of lvm.  Also, when copying through ftp/smb from the server, I max on about 6mb/sec, which is far from the 12.1mb/sec avrange I've gotten out of that network card before (on a slower computer).

Any suggestions on how to improve performance?

(I realize more information is probably preferable, so just tell me what info you would need, as I'm not really skilled with lvm (= I also don't have anything fancy like a fake raid running)).

neuron
