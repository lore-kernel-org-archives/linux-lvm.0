Date: Sat, 31 Jul 1999 13:58:59 -0700
From: Ryan Murray <rmurray@cyberhqz.com>
Subject: [linux-lvm] bug in liblvm 0.7 [added on 11/15/1998]
Message-ID: <19990731135859.C30729@cyberhqz.com>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

The following bit of code tries to "skip" partitions if the main drive
doesn't exist:

pv_read_all_pv.c:102

      for ( n = 0; n < cache_size; n++) {
         dev_name = dir_cache[n].dev_name;
#ifdef DEBUG
         debug ( "pv_read_all_pv -- calling pv_read with \"%s\"\n",
                  dev_name);

         if ( ( tst = open ( dev_name, O_RDONLY)) == -1) {
            if ( MAJOR ( dir_cache[n].st_rdev) != MD_MAJOR &&
                 MINOR ( dir_cache[n].st_rdev) % 16 == 0) {
               n += 15;
               continue;
            }
         } else close ( tst);

this will work for SCSI disks (assuming all partition devices exist),
but fails for IDE disks.  IDE disks can have up to 63 partitions, and a
quick survey shows debian potato creating devices for the first 20, and
slackware 4.0 creating devices for the first 16.

The only way I can see around it is to build a second directory cache as
you move through the dir_cache, listing strings that should be skipped.

ie (semi-pseudo code):

	 for ( i = 0 ; i < skip_cache_size ; i++ ) {
	    if ( !strcmp( dir_cache_skip[i].dev_name, dev_name ) ) {
	       skip = YES;
	       break;
	    }
	 }
	 if ( skip )
	    continue;
         if ( ( tst = open ( dev_name, O_RDONLY)) == -1) {
            if ( MAJOR ( dir_cache[n].st_rdev) != MD_MAJOR &&
                 (MAJOR_IS_SCSI && MINOR ( dir_cache[n].st_rdev) % 16 == 0)
               || (MAJOR_IS_IDE && MINOR ( dir_cache[n].st_rdev) % 64 == 0)) {
               // realloc memory for "dir_skip_cache"
               // allocate memory in dir_skip_cache[skip_cache_size]
               //    for strlen(dev_name)+1
               strcpy( dir_cache_skip[skip_cache_size].dev_name, dev_name );
               skip_cache_size++;
               continue;
            }
         } else close ( tst);

This gets rather ugly -- I wonder if the building of the dir_cache and
the check for the partition existing shouldn't be combined instead,
leaving the dir_cache with entries that exist on this system only?

I put it up here for discussion on what the "best" way to do this is.

The reason I bring this up is that pvscan isn't finding /dev/sda,
because of the skipping.  The % 16 check also isn't valid for IDE, it
needs to be % 64.

-- 
Ryan Murray (rmurray@cyberhqz.com, rmurray@glenayre.com)
Software Designer, Glenayre Technologies Inc.
The opinions expressed here are my own.
