Return-Path: <peter@bartosch.net>
Date: Sun, 10 Jun 2001 22:27:19 +0200
From: Peter Bartosch <peter@bartosch.net>
Message-ID: <20010610222719.B21955@mind.bartosch.net>
References: <20010610222138.A21955@mind.bartosch.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010610222138.A21955@mind.bartosch.net>; from peter@bartosch.net on Sun, Jun 10, 2001 at 10:21:38PM +0200
Subject: [linux-lvm] Re: [reiserfs-list] Reiserfs fragments my MP3
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
To: Reiserfs List <reiserfs-list@namesys.com>
Cc: Linux LVM List <linux-lvm@sistina.com>

Hi!


> hello,
> 
> 
> i just noticed that my new reiserfs on an LVM fragments my MP3
> 
> 
> mpg123 -t shows me:
> 
> mpg123: Can't rewind stream by 95 bits!
> Frame#    89 [ 8156], Time: 00:01.35 [03:34.02], [  171520] mpg123:
> Can't rewind stream by 337 bits!
> Frame#   122 [ 8123], Time: 00:02.66 [03:32.71], [   91904] mpg123:
> Can't rewind stream by 89 bits!
> Frame#   134 [ 8111], Time: 00:02.69 [03:32.68], [  142592] mpg123:
> Can't rewind stream by 410 bits!
> Frame#   142 [ 8103], Time: 00:02.71 [03:32.66], [  174848] mpg123:
> Can't rewind stream by 165 bits!
> Frame#   234 [ 8011], Time: 00:05.34 [03:30.03], [  135424] mpg123:
> Can't rewind stream by 56 bits!
> Frame#   251 [ 7994], Time: 00:05.35 [03:30.02], [  211456] mpg123:
> Can't rewind stream by 19 bits!
> Frame#   254 [ 7991], Time: 00:05.37 [03:30.00], [  222976] mpg123:
> Can't rewind stream by 2 bits!
> Frame#   262 [ 7983], Time: 00:05.39 [03:29.98], [  255232] mpg123:
> Can't rewind stream by 38 bits!
> Frame#   273 [ 7972], Time: 00:06.72 [03:28.65], [   71936] mpg123:
> Can't rewind stream by 66 bits!
> Frame#   274 [ 7971], Time: 00:06.74 [03:28.62], [   71936] mpg123:
> Can't rewind stream by 165 bits!
> Frame#   275 [ 7970], Time: 00:06.77 [03:28.60], [   71936] mpg123:
> Can't rewind stream by 15 bits!
> 
> 
> this file was ok before i copied it to this volume
> 
> 
> my kernel is 2.4.5 with the LVM parts of -AA2
> 
> hmm, i haven't this with an "normal" partition

i just tested it with a normal partition - that works -- so i think i
had to adress this to linux-lvm ...

> 
> :wq - until next mail B-), l8r
> 
> Peter
> -- 
>    :~~~~~~~~~~~~~~~~~~  peter@bartosch.net  ~~~~~~~~~~~~~~~~~~:
>    :          student of technical computer science           :
>    :     university of applied sciences krefeld (germany)     :
>     ~~~~~~~~~~~~~~~~~~~~~~ gpg: 40c9053e ~~~~~~~~~~~~~~~~~~~~~

:wq - until next mail B-), l8r

Peter
-- 
   :~~~~~~~~~~~~~~~~~~  peter@bartosch.net  ~~~~~~~~~~~~~~~~~~:
   :          student of technical computer science           :
   :     university of applied sciences krefeld (germany)     :
    ~~~~~~~~~~~~~~~~~~~~~~ gpg: 40c9053e ~~~~~~~~~~~~~~~~~~~~~
